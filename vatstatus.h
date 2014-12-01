#ifndef VATSTATUS_H
#define VATSTATUS_H

#include <QObject>

class vatstatus : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString codeid READ codeid WRITE setCodeid )
    Q_PROPERTY(QString description READ description WRITE setDescription )
    Q_PROPERTY(QString vatcodeid READ vatcodeid WRITE setVatcodeid )
public:
    explicit vatstatus(QObject *parent = 0);
    QString codeid();
    QString description();
    QString vatcodeid();
    void setCodeid(QString codeid);
    void setDescription(QString description);
    void setVatcodeid(QString vatcodeid);

signals:

public slots:

protected:
    QString mcodeid,mdescription,mvatcodeid;

};

#endif // VATSTATUS_H
