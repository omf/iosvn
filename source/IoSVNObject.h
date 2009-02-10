//metadoc copyright Your Name Here 2008

#ifndef IoSVNObject_DEFINED
#define IoSVNObject_DEFINED 1

#include "IoObject.h"

typedef IoObject IoSVNObjectObject;


typedef struct {
    intptr_t        handle;
} IoSVNObjectData;


#define ISSVNObject(self) (IoObject_hasCloneFunc_(self, (IoTagCloneFunc *)IoSVNObject_rawClone) && (DATA(self) != NULL))

IoTag*      IoSVNObject_newTag(void *state);
IoObject*   IoSVNObject_proto(void *state);
IoObject*   IoSVNObject_rawClone(IoSVNObjectObject *self);
IoObject*   IoSVNObject_mark(IoSVNObjectObject *self);
void        IoSVNObject_free(IoSVNObjectObject *self);

IoObject*   IoSVNObject_printHandle(IoSVNObjectObject *self, IoObject *locals, IoMessage *m);
IoObject*   IoSVNObject_ref(IoSVNObjectObject *self, IoObject *locals, IoMessage *m);
IoObject*   IoSVNObject_value(IoSVNObjectObject *self, IoObject *locals, IoMessage *m);
IoObject*   IoSVNObject_setValue_(IoSVNObjectObject *self, IoObject *locals, IoMessage *m);

#endif

