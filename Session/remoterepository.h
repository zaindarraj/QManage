#ifndef REMOTEREPOSITORY_H
#define REMOTEREPOSITORY_H

#include <QObject>
#include<QNetworkAccessManager>
#include<QNetworkRequest>
#include<QNetworkReply>
#include<QJsonObject>
#include<QJsonDocument>
#include<accessmanageraccessor.h>

class RemoteRepository : public QObject
{
    Q_OBJECT
public:
    explicit RemoteRepository(QObject *parent = nullptr);
    void signIn(const QString& email, const QString& password);

signals:

private :
    QNetworkAccessManager *manager;

};

#endif // REMOTEREPOSITORY_H