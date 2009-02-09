#include "IoSequence_svn.h"
#include "IoSVNObject.h"
#include "svn_string.h"


IoObject *IoSeq_fromSVNString(IoSeq *self, IoObject *locals, IoMessage *m)
{
    IoSVNObjectObject *obj = (IoSVNObjectObject *)IoMessage_locals_valueArgAt_(m, locals, 0);
    IoObject *svnobj = IoObject_rawGetSlot_(obj, IOSYMBOL("svnobj"));
    svn_string_t *str = (svn_string_t *)((IoSVNObjectData *)IoObject_dataPointer(svnobj))->handle;
    return IOSYMBOL(str->data);
}

IoObject *IoSeq_fromSVNCString(IoSeq *self, IoObject *locals, IoMessage *m)
{
    IoSVNObjectObject *obj = (IoSVNObjectObject *)IoMessage_locals_valueArgAt_(m, locals, 0);
    IoObject *svnobj = IoObject_rawGetSlot_(obj, IOSYMBOL("svnobj"));
    const char *str = (const char *)((IoSVNObjectData *)IoObject_dataPointer(svnobj))->handle;
    return IOSYMBOL(str);
}

void IoSequence_svnInit(IoObject *context)
{
    IoState *state = IoObject_state(context);

    IoObject *self = IoState_protoWithInitFunction_(state, IoSeq_proto);

    {
        IoMethodTable methodTable[] = {
        {"fromSVNString", IoSeq_fromSVNString},
        {"fromSVNCString", IoSeq_fromSVNCString},
        {NULL, NULL},
        };

        IoObject_addMethodTable_(self, methodTable);
    }
}

