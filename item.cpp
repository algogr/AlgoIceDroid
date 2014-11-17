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

QString Item::startqty()
{
    return mstartqty;
}

QString Item::salesqty()
{
    return msalesqty;
}

QString Item::remainingqty()
{
    return mremainingqty;
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

void Item::setStartqty(QString startqty)
{
    mstartqty=startqty;
}

void Item::setSalesqty(QString salesqty)
{
    msalesqty=salesqty;
}

void Item::setRemainingqty(QString remainingqty)
{
    mremainingqty=remainingqty;
}
