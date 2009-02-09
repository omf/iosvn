APR := Object clone do (

    libapr := method(
                    self libapr := DynLib clone setPath("/usr/lib/libapr-1.so") open
                    )

    forward := method(
                        name := call message name
                        args := call message argsEvaluatedIn(call sender)
                        if(name beginsWithSeq("apr_") not, name = "apr_" .. name)
                        args prepend(name)
                        //args println
                        libapr performWithArgList("call", args)
                    )
)

Map do (
    fromAprhash := method(ht, pool,
                            key := Object clone
                            key_len := Object clone
                            hi := nil
                            prop := Object clone
                            map := Map clone
                        
                            hi = APR hash_first(pool, ht)
                            loop(
                                if(hi == 0, break)
                                APR hash_this(hi, key ref, key_len ref, prop ref);
                                map atPut(Sequence fromSVNCString(key), Sequence fromSVNString(prop))
                                hi = APR hash_next(hi)
                            )
                            map
                    )
)


