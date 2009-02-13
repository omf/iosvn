AddonBuilder clone do (    
    SystemCall setCommand("apr-config") setArguments(list("--cflags", "--cppflags", "--includes")) run
    aprcompopts := SystemCall stdout readLine
    
    SystemCall setCommand("apr-config") setArguments(list("--link-ld", "--libs")) run
    aprlinkopts := SystemCall stdout readLine

    dependsOnInclude(aprcompopts .. " -I/usr/local/include/subversion-1")
    dependsOnLinkOption(aprlinkopts)
)
