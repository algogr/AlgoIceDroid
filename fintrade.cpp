#include "fintrade.h"
#include "sqlquerymodel.h"

fintrade::fintrade(QObject *parent) :
    QObject(parent)
{
    //QList <storetradeline> mtradeline;
}


QString fintrade::id()
{
    return mid;
}

QString fintrade::ftrdate()
{
    return mftrdate;
}

QString fintrade::dsrid()
{
    return mdsrid;
}

QString fintrade::dsrnumber()
{
    return mdsrnumber;
}

QString fintrade::cusid()
{
    return mcusid;
}

QString fintrade::salesmanid()
{
    return msalesmanid;
}

QString fintrade::comments()
{
    return mcomments;
}
\
QString fintrade::deliveryaddress()
{
    return mdeliveryaddress;
}

QString fintrade::erpupd()
{
    return merpupd;
}

QString fintrade::netvalue()
{
    return mnetvalue;
}

QString fintrade::vatamount()
{
    return mvatamount;
}

QString fintrade::totamount()
{
    return mtotamount;
}

void fintrade::setId(QString id)
{
    mid=id;
}

void fintrade::setFtrdate(QString ftrdate)
{
    mftrdate=ftrdate;
}

void fintrade::setDsrid(QString dsrid)
{
    mdsrid=dsrid;
}

void fintrade::setDsrnumber(QString dsrnumber)
{
    mdsrnumber=dsrnumber;
}

void fintrade::setCusid(QString cusid)
{
    mcusid=cusid;
}

void fintrade::setSalesmanid(QString salesmanid)
{
    msalesmanid=salesmanid;
}

void fintrade::setComments(QString comments)
{
    mcomments=comments;
}

void fintrade::setDeliveryaddress(QString deliveraddress)
{
    mdeliveryaddress=deliveraddress;
}

void fintrade::setErpupd(QString erpupd)
{
    merpupd=erpupd;
}

void fintrade::setNetvalue(QString netvalue)
{
    mnetvalue=netvalue;
}

void fintrade::setVatamount(QString vatamount)
{
    mvatamount=vatamount;
}

void fintrade::setTotamount(QString totamount)
{
    mtotamount=totamount;
}

QString fintrade::insert_db()
{
    QString a=sqlquerymodel::insert_invoice(this);
    return a;

}

void fintrade::delete_db(QString ftrid)
{
    sqlquerymodel::deleteDocument(ftrid);
    return;
}

QString fintrade::last_no(QString type)
{
    QString lastno=sqlquerymodel::get_docseries_lastno(type);
    return lastno;
}


