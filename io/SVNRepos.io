SVNRepos := Object clone do (
    setProto(SVN)

    _prefix := "repos_"
    libsvn := method(
                    self libsvn := DynLib clone setPath("libsvn_repos-1." .. Addon dllSuffix) open
                    )

    init := method( self _init )

    open := method(
                    if(self value, APR pool_clear(self pool value))
                    self repos_open(self ref, call message argsEvaluatedIn(call sender) at(0), self pool)
                    self
                    )

    create := method(
                    if(self value, APR pool_clear(self pool value))
                    self repos_create(self ref, call message argsEvaluatedIn(call sender) at(0), 0, 0, 0, 0, self pool)
                    self
                    )

    fs := method(
                    f := self repos_fs(self value)
                    _fs := SVNFs clone 
                    _fs setValue(f value)
                    _fs
                    )

)
