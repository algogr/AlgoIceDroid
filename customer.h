#ifndef CUSTOMER_H
#define CUSTOMER_H

#include <QObject>

class Customer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString name READ name WRITE setName )
    Q_PROPERTY(QString address READ address WRITE setAddress )
    Q_PROPERTY(QString districtid READ districtid WRITE setDistrictid )
    Q_PROPERTY(QString title READ title WRITE setTitle )
    Q_PROPERTY(QString afm READ afm WRITE setAfm )
    Q_PROPERTY(QString doyid READ doyid WRITE setDoyid )
    Q_PROPERTY(QString erpid READ erpid WRITE setErpid )
    Q_PROPERTY(QString ocpid READ ocpid WRITE setOcpid )
    Q_PROPERTY(QString tel1 READ tel1 WRITE setTel1 )
    Q_PROPERTY(QString tel2 READ tel2 WRITE setTel2 )
    Q_PROPERTY(QString fax READ fax WRITE setFax )
    Q_PROPERTY(QString email READ email WRITE setEmail )
    Q_PROPERTY(QString vatstatusid READ vatstatusid WRITE setVatstatusid )

public:
    explicit Customer(QObject *parent = 0);
    QString id();
    QString name();
    QString address();
    QString districtid();
    QString title();
    QString afm();
    QString doyid();
    QString erpid();
    QString ocpid();
    QString tel1();
    QString tel2();
    QString fax();
    QString email();
    QString vatstatusid();
    void setId(QString id);
    void setName(QString name);
    void setAddress(QString address);
    void setDistrictid(QString districtid);
    void setTitle(QString title);
    void setAfm(QString afm);
    void setDoyid(QString doyid);
    void setErpid(QString erpid);
    void setOcpid(QString ocpid);
    void setTel1(QString tel1);
    void setTel2(QString tel2);
    void setFax(QString fax);
    void setEmail(QString email);
    void setVatstatusid(QString vatstatusid);

signals:

protected:
    QString mid,mname,maddress,mdistrictid,mtitle,mafm,mdoyid,merpid,mocpid,mtel1,mtel2,mfax,memail,mvatstatusid;

protected:


public slots:

};

#endif // CUSTOMER_H
