SVNFs := Object clone do (
    setProto(SVN)
    
    _prefix := "fs_"
    libsvn := method(
                    self libsvn := DynLib clone setPath("/usr/lib/libsvn_fs-1.so") open
                    )

    
)