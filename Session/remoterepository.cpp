#include "remoterepository.h"
#include<QException>
RemoteRepository::RemoteRepository(QObject *parent)
    : QObject{parent}
{
    manager = AccessManagerAccessor::getInstance();
}

void RemoteRepository::signIn(const QString &email, const QString &password)
{
    QNetworkRequest request;
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setUrl(QUrl("http://localhost:3333/api/signIn"));
    QJsonObject obj;
    obj["email"] = email;
    obj["password"] = password;
    QJsonDocument doc(obj);
    QByteArray data = doc.toJson();
    QNetworkReply* reply = manager->post(request, data);

    connect(reply, &QNetworkReply::finished, [=]() {

        if(reply->error() == QNetworkReply::NoError)
        {
            QByteArray response = reply->readAll();
            // do something with the data...
            qDebug() << response;
        }
        else // handle error
        {
         qDebug() <<reply->error();
        }
    });




}
