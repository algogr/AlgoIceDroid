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
#include "item.h"
#include "fintrade.h"
#include "storetradeline.h"


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
    Q_INVOKABLE void updateCustomerBalance(QString cusid,QString amount);
    Q_INVOKABLE QList <QObject*> getItemList();
    Q_INVOKABLE QVariant getItemField(QString iteid,QString fieldname);

    static QString insert_invoice(fintrade *fin);
    static void insertStoreTradeline(storetradeline *stl);
    static QString get_docseries_lastno(QString type);
    static void deleteDocument(QString ftrid);

signals:

public slots:

private:
    QSqlDatabase mydb;

};


#endif // SQLQUERYMODEL_H
