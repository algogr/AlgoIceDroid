#include <QApplication>
//#include <QQmlApplicationEngine>
#include <QtQml>

//#include <QDesktopServices>
#include <QQuickView>
#include <QQuickWindow>
#include "sqlquerymodel.h"
#include "fintrade.h"
#include "storetradeline.h"
#include "btmanage.h"
#include <QtBluetooth>



int main(int argc, char *argv[])
{
    qputenv("QV4_NO_SSA", "1");
    QApplication app(argc, argv);



    QQmlApplicationEngine engine;

    //*****Bluetooth Test****
/*
    QString command;
    QByteArray ba;
    command="! U1 setvar \"device.languages\" \"zpl\"";
    ba=command.toUtf8()+"\n";
    socket.write(ba);
    command="^XA";
    ba=command.toUtf8()+"\n";
    socket.write(ba);
    command="^MNN^LL200";
    ba=command.toUtf8()+"\n";
    socket.write(ba);
    command="^FO0,50^ATN,36,20^FH^FDJIM";
    ba=command.toUtf8()+"\n";
    socket.write(ba);
    command="^FS";
    ba=command.toUtf8()+"\n";
    socket.write(ba);
    command="^XZ";
    ba=command.toUtf8()+"\n";
    socket.write(ba);

*/
    //btmanage *bt=new btmanage;
    qmlRegisterType<sqlquerymodel>("SqlQueryModel", 1, 0, "SqlQueryModel");
    qmlRegisterType<fintrade>("FinTrade", 1, 0, "FinTrade");
    qmlRegisterType<storetradeline>("StoreTradeline", 1, 0, "StoreTradeline");
    qmlRegisterType<Customer>("Customer", 1, 0, "Customer");
    qmlRegisterType<btmanage>("Btmanage", 1, 0, "Btmanage");
    qmlRegisterType<QBluetoothSocket>("QBluetoothSocket", 1, 0, "QBluetoothSocket");
    //QQmlApplicationEngine engine(QUrl("qrc:///main.qml"));
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    //QQuickWindow *window = qobject_cast<QQuickWindow *>(engine.rootObjects().first());
    //window->showFullScreen();

    return app.exec();
}

