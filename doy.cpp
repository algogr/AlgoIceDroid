#include "doy.h"

Doy::Doy(QObject *parent) :
    QObject(parent)
{
}

QString Doy::id()
{
    return mid;
}

QString Doy::code()
{
    return mcode;
}

QString Doy::description()
{
    return mdescription;
}

QString Doy::erpid()
{
    return merpid;
}

void Doy::setId(QString id)
{
    mid=id;
}

void Doy::setCode(QString code)
{
    mcode=code;
}

void Doy::setDescription(QString description)
{
    mdescription=description;
}

void Doy::setErpid(QString erpid)
{
    merpid=erpid;
}
