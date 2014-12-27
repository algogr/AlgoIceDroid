#ifndef BTMANAGE_H
#define BTMANAGE_H

#include <QObject>
#include <QtBluetooth>

class btmanage : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QBluetoothSocket* socket READ socket WRITE setSocket)
private:


public:
    explicit btmanage(QObject *parent = 0);
    Q_INVOKABLE void connecttoprinter(const QString &device);
    Q_INVOKABLE QBluetoothSocket* socket();
    Q_INVOKABLE void setSocket(QBluetoothSocket* socket);
    QBluetoothSocket *msocket ;

signals:

public slots:
    void connected1();


};

#endif // BTMANAGE_H
