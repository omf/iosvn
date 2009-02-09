SVN do (

    forward := method(
                        name := call message name
                        args := call message argsEvaluatedIn(call sender)
                        name = "svn_" .. _prefix .. name
                        args prepend(name)
                        //args println
                        libsvn performWithArgList("call", args)
    )

)

Object do (
    svnobj := nil
    val := method(  if(self svnobj type == "nil", self svnobj = SVNObject clone)
                    self svnobj ptr
            )
    ref := method(  if(self svnobj type == "nil", self svnobj = SVNObject clone)
                    self svnobj ref
            )
    
)


