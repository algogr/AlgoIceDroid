#include "btmanage.h"

btmanage::btmanage(QObject *parent) :
    QObject(parent)
{
    //socket = new QBluetoothSocket(QBluetoothSocket::RfcommSocket);
    socket = new QBluetoothSocket(QBluetoothServiceInfo::RfcommProtocol);
    qDebug() << "Create socket";

    connect(socket,SIGNAL(connected()),this,SLOT(connected1()));
}

void btmanage::connecttoprinter(const QString &device)
{
    QBluetoothDeviceInfo di(QBluetoothAddress(device),"test",QBluetoothUuid::SerialPort);
    //QBluetoothDeviceInfo di;
    //di.se
    //di.se
    QList<QBluetoothUuid> list= di.serviceUuids();
    qDebug()<<"PHASE 1:"<<list;

    socket->connectToService(QBluetoothAddress("AC:3F:A4:1D:BC:4A"),QBluetoothUuid(QString("00001101-0000-1000-8000-00805F9B34FB")),QIODevice::ReadWrite);
    qDebug()<<"PHASE 2";
}



void btmanage::connected1()
{
    //socket.connectToService(QBluetoothAddress(mcaddress),1);
     qDebug()<<socket->peerName() ;
     QString command;
     QByteArray ba;
     command="! U1 setvar \"device.languages\" \"zpl\"";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     //socket.write(ba);
     command="^XA";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^MNN^LL750";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^CWT,E:TT0003M_.TTF";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());

     command="^CFT,30,30";

     //command="^XA^CWZ,E:ARIAL10P.CPF^FS^XZ";
     //command="^XA^CWZ,E:TT0003M_.TTF^FS^XZ";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     //command="^FO0,50^CI28^ATN,36,20^FH^FD- Swiss 721 Greek: ΆΈΉΊΌΐΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΪΫ";
     command="^FO175,50^CI28^ATN,36,20^FH^FDΠΑΣΧΑΛΗΣ ΓΚΟΥΔΙΝΑΚΗΣ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO200,100^CI28^ATN,36,20^FH^FDΕΜΠΟΡΙΑ ΠΑΓΟΥ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO185,150^CI28^ATN,36,20^FH^FDΧΑΛΚΕΡΟ ΚΑΒΑΛΑΣ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO125,200^CI28^ATN,36,20^FH^FDΑΦΜ:027445258 - ΔΟΥ:ΚΑΒΑΛΑΣ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO125,250^CI28^ATN,36,20^FH^FDΤΗΛ:6947 613893 - 6947 613894^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO0,300^GB598,0,8^fs";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     //INVOICE DATA
     command="^FO0,330^CI28^ATN,27,15^FH^FDΤΙΜΟΛΟΓΙΟ ΠΩΛΗΣΗΣ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO250,330^CI28^ATN,27,15^FH^FD1789^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO400,330^CI28^ATN,27,15^FH^FD12/12/2014^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO500,330^CI28^ATN,27,15^FH^FD12:45^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO0,360^GB598,0,8^fs";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     //CUSTOMER DATA
     command="^FO50,380^CI28^ATN,36,20^FH^FDΠΕΛΑΤΗΣ:^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO150,380^CI28^ATN,36,20^FH^FDΠΑΡΑΣΧΟΥ ΔΗΜΗΤΡΗΣ:^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO150,430^CI28^ATN,36,20^FH^FDΕΜΠΟΡΙΟ ΩΩΝ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO50,480^CI28^ATN,36,20^FH^FDΠΑΡΟΔΟΣ ΟΜΟΝΟΙΑΣ 26-28^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO425,480^CI28^ATN,36,20^FH^FDΚΑΒΑΛΑ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO100,530^CI28^ATN,36,20^FH^FDΑΦΜ:027445258^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO350,530^CI28^ATN,36,20^FH^FDΔΟΥ:ΚΑΒΑΛΑΣ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO0,580^GB598,0,8^fs";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     //DETAILS HEADER
     command="^FO0,600^CI28^ATN,27,15^FH^FDΕΙΔΟΣ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO250,600^CI28^ATN,27,15^FH^FDΜΜ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO300,600^CI28^ATN,27,15^FH^FDΠΟΣΟΤΗΤΑ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO400,600^CI28^ATN,27,15^FH^FDΤΙΜΗ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO450,600^CI28^ATN,27,15^FH^FDΑΞΙΑ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO525,600^CI28^ATN,27,15^FH^FDΦΠΑ%^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO0,630^GB598,0,8^fs";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     //DETAILS
     command="^FO0,650^CI28^ATN,27,15^FH^FDΠΑΓΑΚΙ ΣΑΚΟΥΛΑ 5 ΚΙΛΩΝ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO250,650^CI28^ATN,27,15^FH^FDΤΕΜ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO300,650^CI28^ATN,27,15^FH^FD5^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO400,650^CI28^ATN,27,15^FH^FD2,65^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO450,650^CI28^ATN,27,15^FH^FD15,80^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO525,650^CI28^ATN,27,15^FH^FD23%^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO0,680^CI28^ATN,27,15^FH^FDΠΑΓΟΣ ΤΡΙΜΑ ΣΑΚΟΥΛΑ 2.5 ΚΙΛΩΝ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO250,680^CI28^ATN,27,15^FH^FDΤΕΜ^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO300,680^CI28^ATN,27,15^FH^FD15^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO400,680^CI28^ATN,27,15^FH^FD3,65^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO450,680^CI28^ATN,27,15^FH^FD150,80^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO525,680^CI28^ATN,27,15^FH^FD23%^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FO0,710^GB598,0,8^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     //TOTALS

     command="^FΟ250,730^CI28^ATN,36,20^FH^FDΚΑΘΑΡΗ ΑΞΙΑ:^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FΟ550,730^CI28^ATN,36,20^FH^FD1453,75^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FΟ250,780^CI28^ATN,36,20^FH^FDΦΠΑ:^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FΟ550,780^CI28^ATN,36,20^FH^FD153,75^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FΟ250,830^CI28^ATN,36,20^FH^FDΠΛΗΡΩΤΕΟ:^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^FΟ550,830^CI28^ATN,36,20^FH^FD2153,75^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());


     //QTextCodec *codec = QTextCodec::codecForName("Windows-1253");
     //ba = codec->fromUnicode(command)+"\n";
     //ba=command.TO+"\n";
     //socket->write(ba,ba.length());
     command="^FS";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());
     command="^XZ";
     ba=command.toUtf8()+"\n";
     socket->write(ba,ba.length());


}
