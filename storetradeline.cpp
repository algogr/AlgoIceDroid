#include "storetradeline.h"
#include "sqlquerymodel.h"
#include <QDebug>


storetradeline::storetradeline(QObject *parent) :
    QObject(parent)
{
}

QString storetradeline::id()
{
    return mid;
}

QString storetradeline::iteid()
{
    return miteid;
}

QString storetradeline::ftrid()
{
    return mftrid;
}

QString storetradeline::primaryqty()
{
    return mprimaryqty;
}

QString storetradeline::price()
{
    return mprice;
}

QString storetradeline::discount()
{
    return mdiscount;
}

QString storetradeline::discountpercent()
{
    return mdiscountpercent;
}

QString storetradeline::linevalue()
{
    return mlinevalue;
}

QString storetradeline::vatamount()
{
    return mvatamount;
}

QString storetradeline::vatid()
{
    return mvatid;
}

void storetradeline::setId(QString id)
{
    mid=id;
}

void storetradeline::setIteid(QString iteid)\
{
    miteid=iteid;
}

void storetradeline::setFtrid(QString ftrid)
{
    mftrid=ftrid;
}

void storetradeline::setPrimaryqty(QString primaryqty)
{
    mprimaryqty=primaryqty;
}

void storetradeline::setPrice(QString price)
{
    mprice=price;
}

void storetradeline::setDiscount(QString discount)
{
    mdiscount=discount;
}

void storetradeline::setDiscountpercent(QString discountpercent)
{
    mdiscountpercent=discountpercent;
}

void storetradeline::setLinevalue(QString linevalue)
{
    mlinevalue=linevalue;
}

void storetradeline::setVatamount(QString vatamount)
{
    mvatamount=vatamount;
}

void storetradeline::setVatid(QString vatid)
{
    mvatid=vatid;
}

void storetradeline::getptr()
{
    qDebug()<<this;
    return;
}

void storetradeline::insertDb()
{
    sqlquerymodel::insertStoreTradeline(this);
}
