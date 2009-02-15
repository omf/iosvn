Pool := Object clone

APR := Object clone do (
    allocator := Object clone
    
    init := method(
                        initialize 
                        allocator_create(allocator ref) 
                    )
    
    finish := method( terminate )
    
    libapr := method( self libapr := DynLib clone setPath("/usr/lib/libapr-1.so") open )

    forward := method(
                        name := call message name asMutable
                        args := call message argsEvaluatedIn(call sender)
                        if(name beginsWithSeq("apr_") not, name prependSeq("apr_"))
                        r := libapr performWithArgList("call", args prepend(name))
                        Object clone setValue(r)
                    )
                    
    pool_create := method(
                        p := Pool clone
                        args := call message arguments
                        if(args size > 0,
                            pool_create_ex(p ref, doMessage(args at(0)) value, 0, allocator value),
                            pool_create_ex(p ref, 0, 0, allocator value)
                        )
                        p
                    )
)

Map do (
    fromAprhash := method(ht,
                            key := Object clone
                            key_len := Object clone
                            prop := Object clone
                            map := Map clone
                        
                            p := APR pool_create
                        
                            hi := APR hash_first(p value, ht value)
                            loop(
                                if(hi value == 0, break)
                                APR hash_this(hi value, key ref, key_len ref, prop ref);
                                map atPut(Sequence fromSVNCString(key), Sequence fromSVNString(prop))
                                hi = APR hash_next(hi value)
                            )
                            
                            APR pool_destroy(p value)
                            
                            map
                    )
)


