#include "httpcomm.h"
#include <QFile>
#include <QDir>
#include <QSettings>
#include <QtNetwork/QNetworkInterface>
HttpComm::HttpComm(QObject *parent) :
    QObject(parent)
{
    manager = new QNetworkAccessManager(this);
    connect(manager, SIGNAL(finished(QNetworkReply*)),this, SLOT(replyFinished(QNetworkReply*)));
    foreach(QNetworkInterface interface, QNetworkInterface::allInterfaces())
        {
            // Return only the first non-loopback MAC Address
            if (!(interface.flags() & QNetworkInterface::IsLoopBack))

            {
            QString text = interface.hardwareAddress();
            qDebug() << text;
            }
        }

}

void HttpComm::upload()
{


    QString path("./algoicedroid.db");
    qDebug()<<path;
    //QString path("/home/jim/workspace/AlgoIceDroid/algoicedroid.db");
    QString settingsFile = (QDir::currentPath()+ "/settings.ini");
    QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);
    QString server=settings->value("serverAddress").toString();
    QNetworkRequest request(QUrl("http://"+server+"/upload/")); //our server with php-script

    QString bound="margin"; //name of the boundary
    //according to rfc 1867 we need to put this string here:
    QByteArray data(QString("--" + bound + "\r\n").toLocal8Bit());
    data.append("Content-Disposition: form-data; name=\"action\"\r\n\r\n");
    //data.append("testuploads.php\r\n");   //our script's name, as I understood. Please, correct me if I'm wrong
    data.append("--" + bound + "\r\n");   //according to rfc 1867
    QFile file(path);
        if (!file.open(QIODevice::ReadOnly))
        {
            qDebug()<<"NO FILE";
            return;
        }
    QString filename=file.fileName();
    data.append("Content-Disposition: form-data; name=\"upload\"; filename=\""+filename+"\r\n");  //name of the input is "uploaded" in my form, next one is a file name.
    ///data.append("Content-Type: image/jpeg\r\n\r\n"); //data type
    data.append("Content-Type: application/binary\r\n\r\n"); //data type

    data.append(file.readAll());   //let's read the file
    data.append("\r\n");
    data.append("--" + bound + "--\r\n");  //closing boundary according to rfc 1867
    request.setRawHeader(QString("Content-Type").toLocal8Bit(),QString("multipart/form-data; boundary=" + bound).toLocal8Bit());
    request.setRawHeader(QString("Content-Length").toLocal8Bit(), QString::number(data.length()).toLocal8Bit());
    reply = manager->post(request,data);
    delete settings;
}

void HttpComm::upload_ini()
{


    QString path("./settings.ini");
    qDebug()<<path;
    //QString path("/home/jim/workspace/AlgoIceDroid/algoicedroid.db");
    QString settingsFile = (QDir::currentPath()+ "/settings.ini");
    QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);
    QString server=settings->value("serverAddress").toString();
    QNetworkRequest request(QUrl("http://"+server+"/upload/")); //our server with php-script

    QString bound="margin"; //name of the boundary
    //according to rfc 1867 we need to put this string here:
    QByteArray data(QString("--" + bound + "\r\n").toLocal8Bit());
    data.append("Content-Disposition: form-data; name=\"action\"\r\n\r\n");
    //data.append("testuploads.php\r\n");   //our script's name, as I understood. Please, correct me if I'm wrong
    data.append("--" + bound + "\r\n");   //according to rfc 1867
    QFile file(path);
        if (!file.open(QIODevice::ReadOnly))
        {
            qDebug()<<"NO FILE";
            return;
        }
    QString filename=file.fileName();
    data.append("Content-Disposition: form-data; name=\"upload\"; filename=\""+filename+"\r\n");  //name of the input is "uploaded" in my form, next one is a file name.
    ///data.append("Content-Type: image/jpeg\r\n\r\n"); //data type
    data.append("Content-Type: text/plain\r\n\r\n"); //data type

    data.append(file.readAll());   //let's read the file
    data.append("\r\n");
    data.append("--" + bound + "--\r\n");  //closing boundary according to rfc 1867
    request.setRawHeader(QString("Content-Type").toLocal8Bit(),QString("multipart/form-data; boundary=" + bound).toLocal8Bit());
    request.setRawHeader(QString("Content-Length").toLocal8Bit(), QString::number(data.length()).toLocal8Bit());
    reply = manager->post(request,data);
    delete settings;
}


void HttpComm::download()
{
    QString settingsFile = (QDir::currentPath()+ "/settings.ini");
    QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);
    QString server=settings->value("serverAddress").toString();
    qDebug()<<"SERVER"<<settings->value("serverAddress").toString();
    QUrl url("http://"+server+"/upload/algoicedroid.db");
    request.setUrl(url);
    reply=manager->get(request);
    delete settings;
}

void HttpComm::download_ini()
{
    QString settingsFile = (QDir::currentPath()+ "/settings.ini");
    QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);
    QString server=settings->value("serverAddress").toString();

    QUrl url("http://"+server+"/upload/settings.ini");
    request.setUrl(url);
    reply=manager->get(request);
    delete settings;
}


void HttpComm::replyFinished(QNetworkReply *reply)
{
    qDebug()<<"FINISHED";
    //qDebug()<<reply->readAll();
    //qDebug()<<reply->rawHeader("Content-Disposition");
    //qDebug()<<reply->rawHeaderList();

    QVariant content=reply->header(QNetworkRequest::ContentTypeHeader);
    if (content.toString()=="application/octet-stream")
    {

        if(reply->rawHeader("Content-Disposition")=="attachment; filename=\"settings.ini\";")
        {
            qDebug()<<"TEXT";
            //QFile file("/home/jim/test.db");
            QFile file("./settings.ini");
            file.remove();
            file.open(QIODevice::WriteOnly);
            char buffer[reply->size()];
            qint64 size = reply->read(buffer, sizeof(buffer));
            file.write(buffer, size);
            file.close();
            QFile::setPermissions("./settings.ini",QFile::WriteOwner | QFile::ReadOwner);
        }
        else
        {
            qDebug()<<"OCTET";
        //QFile file("/home/jim/test.db");
        QFile file("./algoicedroid.db");
        file.remove();
        file.open(QIODevice::WriteOnly);
        char buffer[reply->size()];
        qint64 size = reply->read(buffer, sizeof(buffer));
        file.write(buffer, size);
        file.close();
        QFile::setPermissions("./algoicedroid.db",QFile::WriteOwner | QFile::ReadOwner);
        }
    }

    if (reply->error() == QNetworkReply::NoError)
            emit reply_finished(false);
    else
            emit reply_finished(true);
    reply->deleteLater();
}

QList<QObject*> HttpComm::getparameters()
{
    QString settingsFile = (QDir::currentPath()+ "/settings.ini");
    QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);
    QString server=settings->value("serverAddress").toString();
    QString printer=settings->value("printerMACaddress").toString().right(5);
    QList<QObject*> parameters;
    EntityDisplay* serverE=new EntityDisplay;
    serverE->setTitle("serverAddress");
    serverE->setValue(server);
    parameters.append(serverE);
    EntityDisplay* printerE=new EntityDisplay;
    printerE->setTitle("printerMACaddress");
    printerE->setValue(printer);
    parameters.append(printerE);
    delete settings;
    return parameters;

}

void HttpComm::setparameters(const QString &name, const QString &value)
{
    qDebug()<<"NAME:"<<name;
    QByteArray byteArray = name.toUtf8();
    const char* param = byteArray.constData();

    //const char* param=name.toStdString().c_str();
    qDebug()<<"PARAMETER:"<<param;
    QString settingsFile = (QDir::currentPath()+ "/settings.ini");
    QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);
    if (name=="printerMACaddress")
    {
        QString oldvalue=settings->value(param).toString();
        qDebug()<<"OLD VALUE:"<<oldvalue;
        QString newvalue=oldvalue.left(12)+value;
        settings->setValue(param,newvalue);
    }
    else
        settings->setValue(param,value);
    settings->sync();
    qDebug()<<"TELOS";
    delete (settings);

}
