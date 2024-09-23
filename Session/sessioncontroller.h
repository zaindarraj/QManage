#ifndef SESSIONCONTROLLER_H
#define SESSIONCONTROLLER_H

#include <QObject>
#include<QWeakPointer>
#include <QSharedPointer>

#include<QtConcurrent/QtConcurrentRun>
class Token;
class Session;
class SessionController : public QObject
{
    Q_OBJECT
public:
    explicit SessionController(QObject *parent = nullptr);
    const QString& accessToken();
    const QString&  refresherToken();


public slots :
    void setAccessToken( const QString& );
    void setRefresherToken( const QString& );

signals:
    void sessionExpired();
    void tokenRefreshed();
    void sessionReady();

private :
    QString _accessToken;
    QString _refrsherToken;

    static void initSession();
};

#endif // SESSIONCONTROLLER_H
