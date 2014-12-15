#ifndef BTMANAGE_H
#define BTMANAGE_H

#include <QObject>
#include <QtBluetooth>

class btmanage : public QObject
{
    Q_OBJECT
private:
    QBluetoothSocket *socket ;

public:
    explicit btmanage(QObject *parent = 0);
    Q_INVOKABLE void connecttoprinter(const QString &device);


signals:

public slots:
    void connected1();


};

#endif // BTMANAGE_H
