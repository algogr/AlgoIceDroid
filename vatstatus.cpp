#include "vatstatus.h"

vatstatus::vatstatus(QObject *parent) :
    QObject(parent)
{
}

QString vatstatus::codeid()
{
    return mcodeid;
}

QString vatstatus::description()
{
    return mdescription;
}

QString vatstatus::vatcodeid()
{
    return mvatcodeid;
}

void vatstatus::setCodeid(QString codeid)
{
    mcodeid=codeid;
}

void vatstatus::setDescription(QString description)
{
    mdescription=description;
}

void vatstatus::setVatcodeid(QString vatcodeid)
{
    mvatcodeid=vatcodeid;
}
