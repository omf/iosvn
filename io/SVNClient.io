SVNClient := Object clone do (
    setProto(SVN)
    
    _prefix := "client_"
    libsvn := method(
                    self libsvn := DynLib clone setPath("libsvn_client-1." .. Addon dllSuffix) open
                    )

    
)
