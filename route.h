#ifndef ROUTE_H
#define ROUTE_H

#include <QObject>

class Route : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString description READ description WRITE setDescription )
    Q_PROPERTY(QString erpid READ erpid WRITE setErpid )


public:
    explicit Route(QObject *parent = 0);
    QString id();
    QString description();
    QString erpid();
    void setId(QString id);
    void setDescription(QString description);
    void setErpid(QString erpid);


signals:

protected:
    QString mid;
    QString mdescription;
    QString merpid;


public slots:

};

#endif // ROUTE_H
