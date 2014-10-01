#ifndef ENTITYDISPLAY_H
#define ENTITYDISPLAY_H

#include <QObject>

class EntityDisplay : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString title READ title WRITE setTitle)
    Q_PROPERTY(QString value READ value WRITE setValue)
public:
    explicit EntityDisplay(QObject *parent = 0);
    QString title();
    QString value();
    void setTitle(QString title);
    void setValue(QString value);

protected:
    QString mtitle,mvalue;

signals:

public slots:

};

#endif // ENTITYDISPLAY_H
