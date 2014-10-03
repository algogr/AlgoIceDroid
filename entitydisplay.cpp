#include "entitydisplay.h"

EntityDisplay::EntityDisplay(QObject *parent) :
    QObject(parent)
{
}

QString EntityDisplay::title()
{
    return mtitle;
}

QString EntityDisplay::value()
{
    return mvalue;
}

QString EntityDisplay::fieldname()
{
    return mfieldname;
}

bool EntityDisplay::editable()
{
    return meditable;
}

void EntityDisplay::setTitle(QString title)
{
    mtitle=title;
}

void EntityDisplay::setValue(QString value)
{
    mvalue=value;
}

void EntityDisplay::setFieldname(QString fieldname)
{
    mfieldname=fieldname;
}

void EntityDisplay::setEditable(bool editable)
{
    meditable=editable;
}
