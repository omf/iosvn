
#ifndef IoSequence_svn_DEFINED
#define IoSequence_svn_DEFINED 1

#include "IoState.h"
#include "IoSeq.h"


IoObject *IoSeq_fromSVNString(IoSeq *self, IoObject *locals, IoMessage *m);
IoObject *IoSeq_fromCString(IoSeq *self, IoObject *locals, IoMessage *m);
void IoSequence_svnInit(IoObject *context);

#endif
