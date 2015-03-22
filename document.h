#ifndef DOCUMENT_H
#define DOCUMENT_H

#include <QObject>
#include <QtBluetooth>
#include "sqlquerymodel.h"

class Document : public QObject
{
    Q_OBJECT
public:
    explicit Document(QObject *parent = 0,QBluetoothSocket *socket=0);
    QString companyname();
    QString companyoccupation();
    QString companyafm();
    QString companydoy();
    QString companytel1();
    QString companytel2();
    QString companyaddress();
    QString companycity();
    QString companyemail();
    QString companywebsite();
    QString customername();
    QString documenttype();
    QString documentnumber();
    QString documentdate();
    QString documenttime();
    QString documentseries();
    QString customeroccupation();
    QString customerafm();
    QString customerdoy();
    QString customeraddress();
    QString customercity();
    QString deliveryaddress();
    QString tvalue();
    QString tvat();
    QString total();
    void setcompanyname(QString name);
    void setcompanyoccupation(QString occupation);
    void setcompanyafm(QString afm);
    void setcompanydoy(QString doy);
    void setcompanytel1(QString tel1);
    void setcompanytel2(QString tel2);
    void setcompanyaddress(QString address);
    void setcompanycity(QString city);
    void setcompanyemail(QString email);
    void setcompanywebsite(QString website);
    void setdocumenttype(QString documenttype);
    void setdocumentnumber(QString documentnumber);
    void setdocumentdate(QString documentdate);
    void setdocumenttime(QString documenttime);
    void setdocumentseries(QString documentseries);
    void setcustomername(QString name);
    void setcustomeroccupation(QString occupation);
    void setcustomerafm(QString afm);
    void setcustomerdoy(QString doy);
    void setcustomeraddress(QString address);
    void setcustomercity(QString city);
    void setdeliveryaddress(QString deliveryaddress);
    void settvalue(QString value);
    void settvat(QString vat);
    void settotal(QString total);
    void printdocument();
    void send(QString command);
    QBluetoothSocket *socket;
    QStringList captions;
    QList <QStringList> lines;


signals:

public slots:

private:
    QString mcompanyname,mcompanyoccupation,mcompanyafm,mcompanydoy,mcompanytel1,mcompanytel2,mcompanyaddress,mcompanycity,\
    mcompanyemail,mcompanywebsite;
    QString mcustomername,mcustomeroccupation,mcustomerafm,mcustomerdoy,mcustomeraddress,mcustomercity,mdeliveryaddress;
    QString mtvalue,mtvat,mtotal;
    QString mdocumenttype,mdocumentnumber,mdocumentdate,mdocumenttime,mdocumentseries;


};

#endif // DOCUMENT_H
