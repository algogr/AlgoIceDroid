#ifndef CUSTOMER_H
#define CUSTOMER_H

#include <QObject>

class Customer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString name READ name WRITE setName )
    Q_PROPERTY(QString address READ address WRITE setAddress )
    Q_PROPERTY(QString district READ district WRITE setDistrict )
    Q_PROPERTY(QString title READ title WRITE setTitle )
    Q_PROPERTY(QString afm READ afm WRITE setAfm )
    Q_PROPERTY(QString doyid READ doyid WRITE setDoyid )
    Q_PROPERTY(QString erpid READ erpid WRITE setErpid )
    Q_PROPERTY(QString occupation READ occupation WRITE setOccupation )
    Q_PROPERTY(QString tel1 READ tel1 WRITE setTel1 )
    Q_PROPERTY(QString tel2 READ tel2 WRITE setTel2 )
    Q_PROPERTY(QString fax READ fax WRITE setFax )
    Q_PROPERTY(QString email READ email WRITE setEmail )
    Q_PROPERTY(QString vatstatusid READ vatstatusid WRITE setVatstatusid )
    Q_PROPERTY(QString city READ city WRITE setCity )
    Q_PROPERTY(QString comments READ comments WRITE setComments )
    Q_PROPERTY(QString routeid READ routeid WRITE setRouteid )
    Q_PROPERTY(QString erpupd READ erpupd()  WRITE setErpupd())
public:
    explicit Customer(QObject *parent = 0);
    Q_INVOKABLE QString id();
    Q_INVOKABLE QString name();
    Q_INVOKABLE QString address();
    Q_INVOKABLE QString district();
    Q_INVOKABLE QString title();
    Q_INVOKABLE QString afm();
    Q_INVOKABLE QString doyid();
    Q_INVOKABLE QString erpid();
    Q_INVOKABLE QString occupation();
    Q_INVOKABLE QString tel1();
    Q_INVOKABLE QString tel2();
    Q_INVOKABLE QString fax();
    Q_INVOKABLE QString email();
    Q_INVOKABLE QString vatstatusid();
    Q_INVOKABLE QString city();
    Q_INVOKABLE QString comments();
    Q_INVOKABLE QString routeid();
    Q_INVOKABLE QString erpupd();
    Q_INVOKABLE void setId(QString id);
    Q_INVOKABLE void setName(QString name);
    Q_INVOKABLE void setAddress(QString address);
    Q_INVOKABLE void setDistrict(QString district);
    Q_INVOKABLE void setTitle(QString title);
    Q_INVOKABLE void setAfm(QString afm);
    Q_INVOKABLE void setDoyid(QString doyid);
    Q_INVOKABLE void setErpid(QString erpid);
    Q_INVOKABLE void setOccupation(QString occupation);
    Q_INVOKABLE void setTel1(QString tel1);
    Q_INVOKABLE void setTel2(QString tel2);
    Q_INVOKABLE void setFax(QString fax);
    Q_INVOKABLE void setEmail(QString email);
    Q_INVOKABLE void setVatstatusid(QString vatstatusid);
    Q_INVOKABLE void setCity(QString city);
    Q_INVOKABLE void setComments(QString comments);
    Q_INVOKABLE void setRouteid(QString routeid);
    Q_INVOKABLE void setErpupd(QString erpupd);
    Q_INVOKABLE void insert();

signals:
    void newcustomer();

protected:
    QString mid,mname,maddress,mdistrict,mtitle,mafm,mdoyid,merpid,moccupation,mtel1,mtel2,mfax,memail,mvatstatusid,\
    mcity,mcomments,mrouteid,merpupd;

protected:


public slots:

};

#endif // CUSTOMER_H
