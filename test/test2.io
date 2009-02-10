SVN
APR init

repos := Object clone
head := Object clone
string := Object clone
hash := Object clone
pool := APR topPool

SVNRepos open(repos ref, "/tmp/repo11", pool value)
fs := SVNRepos fs(repos value)

SVNFs youngest_rev(head ref, fs value, pool value)
writeln("REV: " .. head value)

SVNFs revision_prop(string ref, fs value, head value, "svn:log", pool value)
writeln("svn:log " .. Sequence clone fromSVNString(string))

SVNFs revision_proplist(hash ref, fs value, head value, pool value)
m := Map fromAprhash(hash)
m foreach(k, v, (k .. " " .. v) println)

APR finish
