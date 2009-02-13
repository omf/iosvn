SVN
APR init

repos := Object clone
head := Object clone
string := Object clone
hash := Object clone
pool := APR topPool

tipo:=Object clone
SVNFs type_(tipo ref, System args at(1), pool value)
Sequence fromSVNCString(tipo) println

APR finish
