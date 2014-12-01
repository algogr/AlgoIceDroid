#ifndef FINTRADE_H
#define FINTRADE_H

#include <QObject>
#include <QList>
#include "storetradeline.h"

class fintrade : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString ftrdate READ ftrdate WRITE setFtrdate )
    Q_PROPERTY(QString dsrid READ dsrid WRITE setDsrid )
    Q_PROPERTY(QString dsrnumber READ dsrnumber WRITE setDsrnumber)
    Q_PROPERTY(QString cusid READ cusid WRITE setCusid )
    Q_PROPERTY(QString salesmanid READ salesmanid WRITE setSalesmanid )
    Q_PROPERTY(QString comments READ comments WRITE setComments )
    Q_PROPERTY(QString deliveryaddress READ deliveryaddress WRITE setDeliveryaddress )
    Q_PROPERTY(QString erpupd READ erpupd WRITE setErpupd )
    Q_PROPERTY(QString netvalue READ netvalue WRITE setNetvalue )
    Q_PROPERTY(QString vatamount READ vatamount WRITE setVatamount )
    Q_PROPERTY(QString totamount READ totamount WRITE setTotamount )
    Q_PROPERTY(QString cash READ cash WRITE setCash )



public:
    explicit fintrade(QObject *parent = 0);

    Q_INVOKABLE QString id();
    Q_INVOKABLE QString ftrdate();
    Q_INVOKABLE QString dsrid();
    Q_INVOKABLE QString dsrnumber();
    Q_INVOKABLE QString cusid();
    Q_INVOKABLE QString salesmanid();
    Q_INVOKABLE QString comments();
    Q_INVOKABLE QString deliveryaddress();
    Q_INVOKABLE QString erpupd();
    Q_INVOKABLE QString netvalue();
    Q_INVOKABLE QString vatamount();
    Q_INVOKABLE QString totamount();
    Q_INVOKABLE QString cash();
    Q_INVOKABLE void setId(QString id);
    Q_INVOKABLE void setFtrdate(QString ftrdate);
    Q_INVOKABLE void setDsrid(QString dsrid);
    Q_INVOKABLE void setDsrnumber(QString dsrnumber);
    Q_INVOKABLE void setCusid(QString cusid);
    Q_INVOKABLE void setSalesmanid(QString salesmanid);
    Q_INVOKABLE void setComments(QString comments);
    Q_INVOKABLE void setDeliveryaddress(QString deliveraddress);
    Q_INVOKABLE void setErpupd(QString erpupd);
    Q_INVOKABLE void setNetvalue(QString netvalue);
    Q_INVOKABLE void setVatamount(QString vatamount);
    Q_INVOKABLE void setTotamount(QString totamount);
    Q_INVOKABLE void setCash(QString cash);
    Q_INVOKABLE QString insert_db();
    Q_INVOKABLE void delete_db(QString ftrid);
    Q_INVOKABLE QString last_no(QString type);



protected:

    QString mid,mftrdate,mdsrid,mdsrnumber,mcusid,msalesmanid,mcomments,mdeliveryaddress,merpupd,mnetvalue,mvatamount,mtotamount,mcash;
    QList <const storetradeline*> mtradelines;


signals:

public slots:

};

#endif // FINTRADE_H
