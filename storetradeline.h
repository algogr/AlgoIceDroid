#ifndef STORETRADELINE_H
#define STORETRADELINE_H

#include <QObject>

class storetradeline : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString iteid READ iteid WRITE setIteid )
    Q_PROPERTY(QString ftrid READ ftrid WRITE setFtrid )
    Q_PROPERTY(QString primaryqty READ primaryqty WRITE setPrimaryqty )
    Q_PROPERTY(QString price READ price WRITE setPrice )
    Q_PROPERTY(QString discount READ discount WRITE setDiscount)
    Q_PROPERTY(QString discountpercent READ discountpercent WRITE setDiscountpercent )
    Q_PROPERTY(QString linevalue READ linevalue WRITE setLinevalue )
    Q_PROPERTY(QString vatamount READ vatamount WRITE setVatamount )
    Q_PROPERTY(QString vtcid READ vtcid WRITE setVtcid )




public:
    explicit storetradeline(QObject *parent = 0);
    QString id();
    QString iteid();
    QString ftrid();
    QString primaryqty();
    QString price();
    QString discount();
    QString discountpercent();
    QString linevalue();
    QString vatamount();
    QString vtcid();
    void setId(QString id);
    void setIteid(QString iteid);
    void setFtrid(QString ftrid);
    void setPrimaryqty(QString primaryqty);
    void setPrice(QString price);
    void setDiscount(QString discount);
    void setDiscountpercent(QString discountpercent);
    void setLinevalue(QString linevalue);
    void setVatamount(QString vatamount);
    void setVtcid(QString vtcid);

protected:
    QString mid,miteid,mftrid,mprimaryqty,mprice,mdiscount,mdiscountpercent,mlinevalue,mvatamount,mvtcid;


signals:

public slots:

};

#endif // STORETRADELINE_H
