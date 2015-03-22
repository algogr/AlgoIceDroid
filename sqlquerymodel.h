#ifndef SQLQUERYMODEL_H
#define SQLQUERYMODEL_H
#include <QObject>

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQueryModel>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlRecord>
#include <QtCore/QDebug>
#include "entitydisplay.h"
#include "presentation.h"
#include "customer.h"
#include "route.h"
#include "item.h"
#include "fintrade.h"
#include "storetradeline.h"
#include "doy.h"
#include "vatstatus.h"
class fintrade;


class sqlquerymodel : public QObject
{
    Q_OBJECT

public:
    explicit sqlquerymodel(QObject *parent = 0);
    Q_INVOKABLE bool opendb();
    Q_INVOKABLE void closedb();
    Q_INVOKABLE static QVariant getCustomerField(const QString& cusid,const QString& fieldname);
    Q_INVOKABLE static QVariant getFintradeField(const QString& ftrid,const QString& fieldname);
    Q_INVOKABLE static QList <QObject*> getCustomerListbyRoute(const QString& routeid);
    Q_INVOKABLE static QList <QObject*> getCustomerListbyRoute(const QString& routeid,const QString& phrase);
    Q_INVOKABLE QList <QObject*> getRouteList();
    Q_INVOKABLE static QList <QObject*> CustomerData();
    Q_INVOKABLE static QList <QObject*> CustomerData(const QString& cusid);
    Q_INVOKABLE static void updateCustomerField(const QString& cusid,const QString& fieldname,const QString& value);
    Q_INVOKABLE static void updateCustomerBalance(const QString& cusid,const QString& amount);
    Q_INVOKABLE QList <QObject*> getItemList();
    Q_INVOKABLE static QVariant getItemField(const QString& iteid,const QString& fieldname);
    Q_INVOKABLE static QList <QObject*> getItemTrans(const QString& iteid);
    Q_INVOKABLE static QList <QObject*> getTradelines(const QString& ftrid);
    Q_INVOKABLE static QList <QObject*> getStoreTradelines(const QString& ftrid);
    Q_INVOKABLE QList <QObject*> getInvoices();
    Q_INVOKABLE static QList <QObject*> getIncomeList();
    Q_INVOKABLE static QList <QObject*> getExpensesList();
    Q_INVOKABLE static QVariant getCashtrnField(const QString& id,const QString& fieldname);
    Q_INVOKABLE QList<QObject*> getCustomerBalance();
    Q_INVOKABLE QString getCashOpening();
    Q_INVOKABLE QList <QObject*> getDoyList();
    Q_INVOKABLE QList <QObject*> getVatStatusList();

    Q_INVOKABLE void setCashOpening(const QString& amount);
    Q_INVOKABLE void insertExpense(const QString& amount,const QString& justification,const QString& expensetype);
    Q_INVOKABLE static void updateCashtrnField(const QString& cusid,const QString& fieldname,const QString& value);
    Q_INVOKABLE QString getSumIncome();
    Q_INVOKABLE QString getSumExpenses();
    Q_INVOKABLE QString getDoybyDescription(QString doy);
    Q_INVOKABLE QString getVatStatusbyDescription(QString vatstatus);
    Q_INVOKABLE static float getVatPercent(QString vatid,QString vatstatusid);
    static QString insert_invoice(fintrade *fin);
    static void insertStoreTradeline(storetradeline *stl);
    static QString get_docseries_lastno(const QString& type);
    static void deleteDocument(const QString& ftrid);
    static void insert_customer(Customer* customer);
    static QString  getsalesmanid();
    static QStringList getcompanydata();
signals:

public slots:

private:
    QSqlDatabase mydb;

};

//QSqlDatabase sqlquerymodel::mydb = QSqlDatabase::addDatabase("QSQLITE");
#endif // SQLQUERYMODEL_H
