#ifndef DOY_H
#define DOY_H

#include <QObject>

class Doy : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString code READ code WRITE setCode )
    Q_PROPERTY(QString description READ description WRITE setDescription )
public:
    explicit Doy(QObject *parent = 0);
    QString id();
    QString code();
    QString description();
    void setId(QString id);
    void setCode(QString code);
    void setDescription(QString description);

signals:

protected:
    QString mid,mcode,mdescription;

public slots:

};

#endif // DOY_H
