#ifndef OCCUPATION_H
#define OCCUPATION_H

#include <QObject>

class Occupation : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString description READ description WRITE setDescription )
    Q_PROPERTY(QString erpid READ erpid WRITE setErpid )

public:
    explicit Occupation(QObject *parent = 0);
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

#endif // OCCUPATION_H
