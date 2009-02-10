#include "IoState.h"
#include "IoNumber.h"
#include "IoSVNObject.h"

#define DATA(self) ((IoSVNObjectData *)IoObject_dataPointer(self))

IoTag *IoSVNObject_newTag(void *state)
{
    //printf("IoSVNObject_newTag\n");
    
	IoTag *tag = IoTag_newWithName_("SVNObject");
	IoTag_state_(tag, state);
	IoTag_freeFunc_(tag, (IoTagFreeFunc *)IoSVNObject_free);
	IoTag_markFunc_(tag, (IoTagMarkFunc *)IoSVNObject_mark);
	IoTag_cloneFunc_(tag, (IoTagCloneFunc *)IoSVNObject_rawClone);
	return tag;
}

IoObject *IoSVNObject_proto(void *state)
{
    //printf("IoSVNObject_proto\n");

	IoSVNObjectObject *self = IoObject_new(state);
	IoObject_tag_(self, IoSVNObject_newTag(state));
	IoState_registerProtoWithFunc_(state, self, IoSVNObject_proto);
	{
		IoMethodTable methodTable[] = {
        {"printHandle", IoSVNObject_printHandle},
        {"ref", IoSVNObject_ref},
        {"ptr", IoSVNObject_ptr},
		{NULL, NULL},
		};
		IoObject_addMethodTable_(self, methodTable);
	}

	return self;
}

IoObject *IoSVNObject_rawClone(IoSVNObjectObject *proto)
{
    //printf("IoSVNObject_rawClone\n");

	IoObject *self = IoObject_rawClonePrimitive(proto);
    IoObject_setDataPointer_(self, calloc(1, sizeof(IoSVNObjectData)));
    DATA(self)->handle = (intptr_t)NULL;
    //printf("IoSVNObject_proto->calloc(%p)\n", DATA(self));
	return self;

    //PARA QUE SIEMPRE SEA EL MISMO PROTO
	//return IoState_protoWithInitFunction_(IOSTATE, IoSVNObject_proto);
}

IoObject *IoSVNObject_new(void *state)
{
    printf("IoSVNObject_new\n");
	IoObject* proto = IoState_protoWithInitFunction_(state, IoSVNObject_proto);
    return IOCLONE(proto);

    //PARA QUE SIEMPRE SEA EL MISMO PROTO
	//return IoState_protoWithInitFunction_(state, IoSVNObject_proto);
}

IoObject *IoSVNObject_mark(IoSVNObjectObject* self)
{
    //printf("IoSVNObject_mark\n");
    return self;
}

void IoSVNObject_free(IoSVNObjectObject *self)
{
    //printf("IoSVNObject_free\n");

    if(DATA(self)) {
        //printf("IoSVNObject_free->free(%p)\n", IoObject_dataPointer(self));
        free(IoObject_dataPointer(self));
    }
}

//--------------------------------------------------------------------------------------

IoObject *IoSVNObject_printHandle(IoSVNObjectObject *self, IoObject *locals, IoMessage *m)
{
    if(!ISSVNObject(self)) return IONIL(self);

    printf("%x\n", DATA(self)->handle);
    return self;
}

IoObject *IoSVNObject_ref(IoSVNObjectObject *self, IoObject *locals, IoMessage *m)
{
    IoObject *ret = IONIL(self);

    if(!ISSVNObject(self)) {
        printf("IoSVNObject_ref INVALID OBJECT\n");
    }
    else {
        ret = IONUMBER((intptr_t)DATA(self));
    }
    
    return ret;
}

IoObject *IoSVNObject_ptr(IoSVNObjectObject *self, IoObject *locals, IoMessage *m)
{
    IoObject *ret = IONIL(self);

    if(!ISSVNObject(self)) {
        printf("IoSVNObject_ptr INVALID OBJECT\n");
    }
    else {
        ret = IONUMBER((intptr_t)DATA(self)->handle);
    }
    
    return ret;
}


