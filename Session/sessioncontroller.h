#ifndef SESSIONCONTROLLER_H
#define SESSIONCONTROLLER_H

#include <QObject>
#include<QSharedPointer>
#include<QByteArray>
#include<QJsonDocument>
#include<QQmlEngine>


#include<QtConcurrent/QtConcurrentRun>
class SessionRepository;
class SessionController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit SessionController(QObject *parent = nullptr);
    const QString& accessToken();
    const QString&  refresherToken();


public slots :
    void setAccessToken( const QString& );
    void setRefresherToken( const QString& );
    void setTokens(const QByteArray&);
    void signIn(const QString& email, const QString& password);

signals:
    void sessionExpired();
    void tokenRefreshed();
    void sessionReady();

private :
    QString _accessToken = "";
    QString _refrsherToken = "";
    QSharedPointer<SessionRepository> sessionRepositoy;


};
#endif // SESSIONCONTROLLER_H
