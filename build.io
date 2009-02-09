AddonBuilder clone do (    
    SystemCall setCommand("apr-config") setArguments(list("--cflags", "--cppflags", "--includes")) run
    aprcompopts := SystemCall stdout readLine
    
    SystemCall setCommand("apr-config") setArguments(list("--link-ld", "--libs")) run
    aprlinkopts := SystemCall stdout readLine

    //dependsOnLib("svn_repos-1")
    //dependsOnLib("svn_fs-1")
    dependsOnInclude(aprcompopts .. " -I/usr/include/subversion-1")
    dependsOnLinkOption(aprlinkopts)
)