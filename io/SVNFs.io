SVNFs := Object clone do (
    setProto(SVN)
    
    _prefix := "fs_"
    libsvn := method(
                    self libsvn := DynLib clone setPath("libsvn_fs-1." .. Addon dllSuffix) open
                    )
    fsType := method(
                    libsvn performWithArgList("call", list("svn_fs_type", call message arguments) flatten)
                    )

    init := method( self _init )
)
