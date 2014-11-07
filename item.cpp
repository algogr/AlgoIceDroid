#include "item.h"

Item::Item(QObject *parent) :
    QObject(parent)
{
}

QString Item::id()
{
    return mid;
}

QString Item::code()
{
    return mcode;
}

QString Item::description()
{
    return mdescription;
}

QString Item::price()
{
    return mprice;
}

QString Item::vatid()
{
    return mvatid;
}

QString Item::maxdiscount()
{
    return mmaxdiscount;
}

void Item::setId(QString id)
{
    mid=id;
}

void Item::setCode(QString code)
{
    mcode=code;
}

void Item::setDescription(QString description)
{
    mdescription=description;
}

void Item::setPrice(QString price)
{
    mprice=price;
}

void Item::setVatid(QString vatid)
{
    mvatid=vatid;
}

void Item::setMaxdiscount(QString maxdiscount)
{
    mmaxdiscount=maxdiscount;
}


