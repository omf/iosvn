SVNRepos := Object clone do (
    setProto(SVN)
    
    _prefix := "repos_"
    libsvn := method(
                    self libsvn := DynLib clone setPath("libsvn_repos-1." .. Addon dllSuffix) open
                    )

    
)
