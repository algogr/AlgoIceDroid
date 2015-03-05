#ifndef HTTPCOMM_H
#define HTTPCOMM_H

#include <QObject>
#include <QtNetwork/QNetworkRequest>
#include <QtNetwork/QNetworkReply>
#include <QtNetwork/QNetworkAccessManager>

class HttpComm : public QObject
{
    Q_OBJECT
public:
    explicit HttpComm(QObject *parent = 0);
    Q_INVOKABLE void upload();
    Q_INVOKABLE void download();
    Q_INVOKABLE void upload_ini();
    Q_INVOKABLE void download_ini();


private:
    QNetworkAccessManager *manager;
    QNetworkRequest request;
    QNetworkReply* reply;
    QString mac;

signals:
    void reply_finished(bool error);

public slots:
    void replyFinished(QNetworkReply* reply);

};

#endif // HTTPCOMM_H
