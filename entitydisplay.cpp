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

void EntityDisplay::setTitle(QString title)
{
    mtitle=title;
}

void EntityDisplay::setValue(QString value)
{
    mvalue=value;
}
