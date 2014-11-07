#include <QApplication>
//#include <QQmlApplicationEngine>
#include <QtQml>

//#include <QDesktopServices>
//#include <QQuickView>
#include "sqlquerymodel.h"
#include <QPrinterInfo>
#include <QtPrintSupport/QPrintEngine>




int main(int argc, char *argv[])
{
    QApplication app(argc, argv);



    QQmlApplicationEngine engine;


    QPrinterInfo prinfo;
    QList<QPrinterInfo> avpr=prinfo.availablePrinters();
    /*
    qDebug()<<"No printers"<<avpr.size();
    for(int i;i<avpr.size();i++)
    {
        qDebug()<<"PRINTERS:"<<avpr[i].makeAndModel();
    }
    qDebug()<<"PRINTERS:" ;
*/
    qmlRegisterType<sqlquerymodel>("SqlQueryModel", 1, 0, "SqlQueryModel");
    //QQmlApplicationEngine engine(QUrl("qrc:///main.qml"));
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}

