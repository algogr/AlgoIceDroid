#include "district.h"

District::District(QObject *parent) :
    QObject(parent)
{
}

QString District::id()
{
    return mid;
}

QString District::description()
{
    return mdescription;
}

QString District::city()
{
    return mcity;
}

QString District::erpid()
{
    return merpid;
}

QString District::county()
{
    return mcounty;
}

void District::setId(QString id)
{
    mid=id;
}

void District::setDescription(QString description)
{
    mdescription=description;
}

void District::setCity(QString city)
{
    mcity=city;
}

void District::setErpid(QString erpid)
{
    merpid=erpid;
}

void District::setCounty(QString county)
{
    mcounty=county;
}
