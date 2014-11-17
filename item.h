#ifndef ITEM_H
#define ITEM_H

#include <QObject>

class Item : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString code READ code WRITE setCode)
    Q_PROPERTY(QString description READ description WRITE setDescription )
    Q_PROPERTY(QString price READ price WRITE setPrice)
    Q_PROPERTY(QString vatid READ vatid WRITE setVatid)
    Q_PROPERTY(QString maxdiscount READ maxdiscount WRITE setMaxdiscount)
    Q_PROPERTY(QString startqty READ startqty WRITE setStartqty)
    Q_PROPERTY(QString salesqty READ salesqty WRITE setSalesqty)
    Q_PROPERTY(QString remainingqty READ remainingqty WRITE setRemainingqty)

public:
    explicit Item(QObject *parent = 0);
    QString id();
    QString code();
    QString description();
    QString price();
    QString vatid();
    QString maxdiscount();
    QString startqty();
    QString salesqty();
    QString remainingqty();
    void setId(QString id);
    void setCode(QString code);
    void setDescription(QString description);
    void setPrice(QString price);
    void setVatid(QString vatid);
    void setMaxdiscount(QString maxdiscount);
    void setStartqty(QString startqty);
    void setSalesqty(QString salesqty);
    void setRemainingqty(QString remainingqty);

protected:
    QString mid,mcode,mdescription,mprice,mvatid,mmaxdiscount,mstartqty,msalesqty,mremainingqty;


signals:

public slots:

};

#endif // ITEM_H
