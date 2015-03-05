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
    QString settingsFile = (QDir::currentPath()+ "/settings.ini");
    QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);

    QString address=settings->value("printerMACaddress").toString();
    qDebug()<<"SETTINGS"<<address;
    msocket->connectToService(QBluetoothAddress(address),QBluetoothUuid(QString("00001101-0000-1000-8000-00805F9B34FB")),QIODevice::ReadWrite);
    qDebug()<<"PHASE 2";
    delete settings;
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
