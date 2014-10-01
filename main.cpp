#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QDesktopServices>
#include <QQuickView>
#include "sqlquerymodel.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<sqlquerymodel>("SqlQueryModel", 1, 0, "SqlQueryModel");
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
