//metadoc copyright Your Name Here 2008

#ifndef IoSVN_DEFINED
#define IoSVN_DEFINED 1

#include "IoObject.h"

typedef IoObject IoSVNObject;


IoTag*      IoSVN_newTag(void *state);
IoObject*   IoSVN_proto(void *state);
IoObject*   IoSVN_rawClone(IoSVNObject *self);
IoObject*   IoSVN_mark(IoSVNObject *self);
void        IoSVN_free(IoSVNObject *self);

#endif

