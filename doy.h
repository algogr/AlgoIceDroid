#ifndef DOY_H
#define DOY_H

#include <QObject>

class Doy : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString code READ code WRITE setCode )
    Q_PROPERTY(QString description READ description WRITE setDescription )
    Q_PROPERTY(QString erpid READ erpid WRITE setErpid )
public:
    explicit Doy(QObject *parent = 0);
    QString id();
    QString code();
    QString description();
    QString erpid();
    void setId(QString id);
    void setCode(QString code);
    void setDescription(QString description);
    void setErpid(QString erpid);

signals:

protected:
    QString mid,mcode,mdescription,merpid;

public slots:

};

#endif // DOY_H
