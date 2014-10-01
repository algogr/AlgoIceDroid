#include "occupation.h"

Occupation::Occupation(QObject *parent) :
    QObject(parent)
{
}

QString Occupation::id()
{
    return mid;
}

QString Occupation::description()
{
    return mdescription;
}

QString Occupation::erpid()
{
    return mid;
}

void Occupation::setId(QString id)
{
    mid=id;
}

void Occupation::setDescription(QString description)
{
    mdescription=description;
}

void Occupation::setErpid(QString erpid)
{
    merpid=erpid;
}
