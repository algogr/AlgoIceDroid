#include "btmanage.h"

btmanage::btmanage(QObject *parent) :
    QObject(parent)
{
    //socket = new QBluetoothSocket(QBluetoothSocket::RfcommSocket);
    msocket = new QBluetoothSocket(QBluetoothServiceInfo::RfcommProtocol);
    qDebug() << "Create socket";
    connecttoprinter("paparia");
    connect(msocket,SIGNAL(connected()),this,SLOT(connected1()));
}

void btmanage::connecttoprinter(const QString &device)
{
    QBluetoothDeviceInfo di(QBluetoothAddress(device),"test",QBluetoothUuid::SerialPort);
    //QBluetoothDeviceInfo di;
    //di.se
    //di.se
    QList<QBluetoothUuid> list= di.serviceUuids();
    qDebug()<<"PHASE 1:"<<list;

    msocket->connectToService(QBluetoothAddress("AC:3F:A4:1D:BC:4A"),QBluetoothUuid(QString("00001101-0000-1000-8000-00805F9B34FB")),QIODevice::ReadWrite);
    qDebug()<<"PHASE 2";
}



void btmanage::connected1()
{
    //socket.connectToService(QBluetoothAddress(mcaddress),1);
    //connecttoprinter("paparia");
     qDebug()<<msocket->peerName() ;


}

QBluetoothSocket* btmanage::socket()
{
    return msocket;
}

void btmanage::setSocket(QBluetoothSocket *socket)
{
    msocket=socket;
}
