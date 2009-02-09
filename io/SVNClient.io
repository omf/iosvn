SVNClient := Object clone do (
    setProto(SVN)
    
    _prefix := "client_"
    libsvn := method(
                    self libsvn := DynLib clone setPath("/usr/lib/libsvn_client-1.so") open
                    )

    
)