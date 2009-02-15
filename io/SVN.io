Object do (
    svnobj := method(self svnobj := SVNObject clone)
    
    value := method(self svnobj value)
    setValue := method(v, self svnobj setValue(v))
    ref := method(self svnobj ref)
)

APR init

SVN do (

    /* Top pool */
    pool := APR pool_create

    _init := method( self pool := APR pool_create(SVN pool) )

    forward := method(
                        name := call message name asMutable
                        args := call message argsEvaluatedIn(call sender)
                        //TODO do this better
                        if(args last type != Pool type,
                            args append(self pool value),
                            args append(args removeLast value)
                        )
                        args println
                        
                        if(name containsSeq(_prefix) not, name prependSeq(_prefix))
                        name prependSeq("svn_")
                        args prepend(name)
                        
                        r := libsvn performWithArgList("call", args)
                        obj := Object clone
                        if(call message arguments at(0) name containsSeq(" ref") not,
                            obj setValue(r),
                            obj = r
                        )
                        obj
                    )

)

