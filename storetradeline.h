#ifndef STORETRADELINE_H
#define STORETRADELINE_H

#include <QObject>

class storetradeline: public QObject
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
    Q_PROPERTY(QString vatid READ vatid WRITE setVatid )




public:
    explicit storetradeline(QObject *parent = 0);
    Q_INVOKABLE QString id();
    Q_INVOKABLE QString iteid();
    Q_INVOKABLE QString ftrid();
    Q_INVOKABLE QString primaryqty();
    Q_INVOKABLE QString price();
    Q_INVOKABLE QString discount();
    Q_INVOKABLE QString discountpercent();
    Q_INVOKABLE QString linevalue();
    Q_INVOKABLE QString vatamount();
    Q_INVOKABLE QString vatid();
    Q_INVOKABLE void setId(QString id);
    Q_INVOKABLE void setIteid(QString iteid);
    Q_INVOKABLE void setFtrid(QString ftrid);
    Q_INVOKABLE void setPrimaryqty(QString primaryqty);
    Q_INVOKABLE void setPrice(QString price);
    Q_INVOKABLE void setDiscount(QString discount);
    Q_INVOKABLE void setDiscountpercent(QString discountpercent);
    Q_INVOKABLE void setLinevalue(QString linevalue);
    Q_INVOKABLE void setVatamount(QString vatamount);
    Q_INVOKABLE void setVatid(QString vacid);
    Q_INVOKABLE void getptr();
    Q_INVOKABLE void insertDb();

protected:
    QString mid,miteid,mftrid,mprimaryqty,mprice,mdiscount,mdiscountpercent,mlinevalue,mvatamount,mvatid;


signals:

public slots:

};

#endif // STORETRADELINE_H
