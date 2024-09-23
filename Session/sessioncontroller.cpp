#include "sessioncontroller.h"
#include<token.h>
#include<session.h>

SessionController::SessionController(QObject *parent)
    : QObject{parent}
{
    QFuture<void> future = QtConcurrent::run([=] {
        SessionController::initSession();
    });
}


 const QString& SessionController::accessToken()
{

        return _accessToken;
 }

 const QString&  SessionController::refresherToken()
{

    return _refrsherToken;
}

void SessionController::setAccessToken(const QString& token)
{
        _accessToken = token;
}

void SessionController::setRefresherToken(const QString& token)
{
         _refrsherToken = token;
}


void SessionController::initSession()
{
    Session::getInstance();

}


