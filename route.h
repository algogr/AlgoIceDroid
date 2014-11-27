#ifndef DISTRICT_H
#define DISTRICT_H

#include <QObject>

class District : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString description READ description WRITE setDescription )
    Q_PROPERTY(QString city READ city WRITE setCity )
    Q_PROPERTY(QString erpid READ erpid WRITE setErpid )
    Q_PROPERTY(QString county READ county WRITE setCounty )

public:
    explicit District(QObject *parent = 0);
    QString id();
    QString description();
    QString city();
    QString erpid();
    QString county();
    void setId(QString id);
    void setDescription(QString description);
    void setCity(QString city);
    void setErpid(QString erpid);
    void setCounty(QString county);

signals:

protected:
    QString mid;
    QString mdescription;
    QString mcity;
    QString merpid;
    QString mcounty;

public slots:

};

#endif // DISTRICT_H
