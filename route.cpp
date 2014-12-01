#include "route.h"

Route::Route(QObject *parent) :
    QObject(parent)
{
}

QString Route::id()
{
    return mid;
}

QString Route::description()
{
    return mdescription;
}


QString Route::erpid()
{
    return merpid;
}


void Route::setId(QString id)
{
    mid=id;
}

void Route::setDescription(QString description)
{
    mdescription=description;
}


void Route::setErpid(QString erpid)
{
    merpid=erpid;
}

