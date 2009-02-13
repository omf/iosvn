SVNFs := Object clone do (
    setProto(SVN)
    
    _prefix := "fs_"
    libsvn := method(
                    self libsvn := DynLib clone setPath("libsvn_fs-1." .. Addon dllSuffix) open
                    )

    type_ := method(a, b, c, libsvn performWithArgList("call", list("svn_fs_type", a, b, c)))
)
