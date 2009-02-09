SVN

allocator := Object clone
pool := Object clone
repos := Object clone
fs_ := nil
head := Object clone
string := Object clone
hash := Object clone

APR initialize 
APR allocator_create(allocator ref) 
APR pool_create_ex(pool ref, 0, 0, allocator val)


SVNRepos open(repos ref, "/tmp/repo11", pool val)
fs_ = SVNRepos fs(repos val)

SVNFs youngest_rev(head ref, fs_, pool val)
writeln("REV: " .. head val)

SVNFs revision_prop(string ref, fs_, head val, "svn:log", pool val)
writeln("svn:log " .. Sequence clone fromSVNString(string))

SVNFs revision_proplist(hash ref, fs_, head val, pool val)
m := Map fromAprhash(hash val, pool val)
m foreach(k, v, (k .. " " .. v) println)


APR pool_destroy(pool val)
APR terminate
