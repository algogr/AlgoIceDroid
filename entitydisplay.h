#ifndef ENTITYDISPLAY_H
#define ENTITYDISPLAY_H

#include <QObject>

class EntityDisplay : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString title READ title WRITE setTitle)
    Q_PROPERTY(QString value READ value WRITE setValue)
    Q_PROPERTY(QString fieldname READ fieldname WRITE setFieldname)
    Q_PROPERTY(bool editable READ editable WRITE setEditable)
public:
    explicit EntityDisplay(QObject *parent = 0);
    QString title();
    QString value();
    QString fieldname();
    bool editable();
    void setTitle(QString title);
    void setValue(QString value);
    void setFieldname(QString fieldname);
    void setEditable(bool editable);
protected:
    QString mtitle,mvalue,mfieldname;
    bool meditable;
signals:

public slots:

};

#endif // ENTITYDISPLAY_H
