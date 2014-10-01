#include "customer.h"

Customer::Customer(QObject *parent) :
    QObject(parent)
{
}

QString Customer::id()
{
    return mid;
}

QString Customer::name()
{
    return mname;
}

QString Customer::address()
{
    return maddress;
}

QString Customer::districtid()
{
    return mdistrictid;
}

QString Customer::title()
{
    return mtitle;
}

QString Customer::afm()
{
    return mafm;
}

QString Customer::doyid()
{
    return mdoyid;
}

QString Customer::erpid()
{
    return merpid;
}

QString Customer::ocpid()
{
    return mocpid;
}

QString Customer::tel1()
{
    return mtel1;
}

QString Customer::tel2()
{
    return mtel2;
}

QString Customer::fax()
{
    return mfax;
}

QString Customer::email()
{
    return memail;
}

QString Customer::vatstatusid()
{
    return mvatstatusid;
}

void Customer::setId(QString id)
{
    mid=id;
}

void Customer::setName(QString name)
{
    mname=name;
}

void Customer::setAddress(QString address)
{
    maddress=address;
}

void Customer::setDistrictid(QString districtid)
{
    mdistrictid=districtid;
}

void Customer::setTitle(QString title)
{
    mtitle=title;
}

void Customer::setAfm(QString afm)
{
    mafm=afm;
}

void Customer::setDoyid(QString doyid)
{
    mdoyid=doyid;
}

void Customer::setErpid(QString erpid)
{
    merpid=erpid;
}

void Customer::setOcpid(QString ocpid)
{
    mocpid=ocpid;
}

void Customer::setTel1(QString tel1)
{
    mtel1=tel1;
}

void Customer::setTel2(QString tel2)
{
    mtel1=tel2;
}

void Customer::setFax(QString fax)
{
    mfax=fax;
}

void Customer::setEmail(QString email)
{
    memail=email;
}

void Customer::setVatstatusid(QString vatstatusid)
{
    mvatstatusid=vatstatusid;
}

