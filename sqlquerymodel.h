#ifndef SQLQUERYMODEL_H
#define SQLQUERYMODEL_H
#include <QObject>

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQueryModel>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlRecord>
#include <QtCore/QDebug>
#include "customer.h"
#include "district.h"


class sqlquerymodel : public QObject
{
    Q_OBJECT

public:
    explicit sqlquerymodel(QObject *parent = 0);
    Q_INVOKABLE bool opendb();
    Q_INVOKABLE QVariant getCustomerField(QString cusid,QString fieldname);
    Q_INVOKABLE QList <QObject*> getCustomerListbyDistrict(QString districtid);
    Q_INVOKABLE QList <QObject*> getDistrictList();
    Q_INVOKABLE QList <QObject*> CustomerData(QString cusid);
    Q_INVOKABLE void updateCustomerField(QString cusid,QString fieldname,QString value);

signals:

public slots:

private:
    QSqlDatabase mydb;

};

#endif // SQLQUERYMODEL_H
