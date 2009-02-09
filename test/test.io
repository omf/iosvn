SVN

allocator := Object clone
pool := Object clone
repos := Object clone


testdir := Directory setPath("/tmp/iosvntest")
//reposdir := Directory setPath(testdir path .. "/repos")
//importdir := Directory setPath(testdir path .. "/import")
//if(testdir exists, testdir remove; testdir create)

APR initialize
APR allocator_create(allocator ref)
APR pool_create_ex(pool ref, 0, 0, allocator val)
SVNRepos repos_create(repos ref, reposdir path, 0, 0, 0, 0, pool val)
APR pool_destroy(pool val)
APR terminate

