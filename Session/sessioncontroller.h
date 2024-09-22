#ifndef SESSIONCONTROLLER_H
#define SESSIONCONTROLLER_H

#include <QObject>
#include<session.h>
class SessionController : public QObject
{
    Q_OBJECT
public:
    explicit SessionController(QObject *parent = nullptr);
    Q_INVOKABLE Token getAccessToken();
    Q_INVOKABLE Token getRefreshToken();


signals:
    void sessionExpired();
    void sesison();

private :
    Session * session;

};

#endif // SESSIONCONTROLLER_H
