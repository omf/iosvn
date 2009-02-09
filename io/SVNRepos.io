SVNRepos := Object clone do (
    setProto(SVN)
    
    _prefix := "repos_"
    libsvn := method(
                    self libsvn := DynLib clone setPath("/usr/lib/libsvn_repos-1.so") open
                    )

    
)