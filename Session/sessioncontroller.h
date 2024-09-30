#ifndef SESSIONCONTROLLER_H
#define SESSIONCONTROLLER_H

#include <QObject>
#include<QSharedPointer>
#include<QByteArray>
#include<QJsonDocument>
#include<QQmlEngine>
#include<QtConcurrent/QtConcurrentRun>
class SessionRepository;
class SessionState;

class SessionController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit SessionController(QObject *parent = nullptr);
    QString accessToken();
    QString refresherToken();


public slots :
    void signIn(const QString& email, const QString& password);
    void check(SessionState state);

signals:
    void sessionExpired();
    void tokenRefreshed();
    void sessionReady();
    void errorOccured(const QString&);

private :

    QSharedPointer<SessionRepository> sessionRepositoy;


};
#endif // SESSIONCONTROLLER_H
