#include "customer.h"
#include "sqlquerymodel.h"

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

QString Customer::district()
{
    return mdistrict;
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

QString Customer::occupation()
{
    return moccupation;
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

QString Customer::city()
{
    return mcity;
}

QString Customer::comments()
{
    return mcomments;
}

QString Customer::routeid()
{
    return mrouteid;
}

QString Customer::erpupd()
{
    return merpupd;
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

void Customer::setDistrict(QString district)
{
    mdistrict=district;
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

void Customer::setOccupation(QString occupation)
{
    moccupation=occupation;
}

void Customer::setTel1(QString tel1)
{
    mtel1=tel1;
}

void Customer::setTel2(QString tel2)
{
    mtel2=tel2;
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

void Customer::setCity(QString city)
{
    mcity=city;
}

void Customer::setComments(QString comments)
{
    mcomments=comments;
}

void Customer::setRouteid(QString routeid)
{
    mrouteid=routeid;
}

void Customer::setErpupd(QString erpupd)
{
    merpupd=erpupd;
}

void Customer::insert()
{
    sqlquerymodel::insert_customer(this);
}
