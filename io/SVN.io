SVN do (

    forward := method(
                        name := call message name
                        args := call message argsEvaluatedIn(call sender)
                        name = "svn_" .. _prefix .. name
                        args prepend(name)
                        
                        if(call message arguments at(0) name containsSeq(" ref") not,
                            r := libsvn performWithArgList("call", args)
                            Object clone setValue(r),
    
                            libsvn performWithArgList("call", args)
                        )
                )

    removeSlot("type")
)

Object do (
    svnobj := method(self svnobj := SVNObject clone)
    
    value := method(self svnobj value)
    setValue := method(v, self svnobj setValue(v))
    ref := method(self svnobj ref)
)


