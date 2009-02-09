//metadoc SVNtxn copyright Your Name Here
//metadoc SVNtxn license BSD revised
//metadoc SVNtxn category Example
/*metadoc SVNtxn description
Describe your addon here.
*/

#include "IoState.h"
#include "IoSVN.h"

IoTag *IoSVN_newTag(void *state)
{
    //printf("IoSVN_newTag\n");

	IoTag *tag = IoTag_newWithName_("SVN");
	IoTag_state_(tag, state);
	//IoTag_freeFunc_(tag, (IoTagFreeFunc *)IoSVN_free);
	//IoTag_markFunc_(tag, (IoTagMarkFunc *)IoSVN_mark);
	//IoTag_cloneFunc_(tag, (IoTagCloneFunc *)IoSVN_rawClone);
	return tag;
}

IoObject *IoSVN_proto(void *state)
{
    //printf("IoSVN_proto\n");

	IoSVNObject *self = IoObject_new(state);
	IoObject_tag_(self, IoSVN_newTag(state));
	IoState_registerProtoWithFunc_(state, self, IoSVN_proto);
	{
		IoMethodTable methodTable[] = {
		{NULL, NULL},
		};
		IoObject_addMethodTable_(self, methodTable);
	}

	return self;
}

IoObject *IoSVN_rawClone(IoSVNObject *proto)
{
    printf("IoSVN_rawClone\n");

	IoObject *self = IoObject_rawClonePrimitive(proto);
	return self;

    //PARA QUE SIEMPRE SEA EL MISMO PROTO
	//return IoState_protoWithInitFunction_(IOSTATE, IoSVN_proto);
}

IoObject *IoSVN_new(void *state)
{
    printf("IoSVN_new\n");
	IoObject* proto = IoState_protoWithInitFunction_(state, IoSVN_proto);
    return IOCLONE(proto);

    //PARA QUE SIEMPRE SEA EL MISMO PROTO
	//return IoState_protoWithInitFunction_(state, IoSVN_proto);
}

IoObject *IoSVN_mark(IoSVNObject* self)
{
    printf("IoSVN_mark\n");
    return self;
}

void IoSVN_free(IoSVNObject *self)
{
    printf("IoSVN_free\n");

}

//--------------------------------------------------------------------------------------

