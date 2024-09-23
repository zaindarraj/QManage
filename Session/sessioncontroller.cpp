#include "sessioncontroller.h"
#include<token.h>
#include<session.h>
#include<sessionrepository.h>

SessionController::SessionController(QObject *parent)
    : QObject{parent}
{
    sessionRepositoy= QSharedPointer<SessionRepository>(new SessionRepository);

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

void SessionController::setTokens(const QByteArray & val)
{
    QJsonDocument doc = QJsonDocument::fromJson(val);
    Token accessToken = Token::fromJson(doc["accessToken"].toObject(), token_type::ACCESS_TOKEN);
    Token refreshToken = Token::fromJson(doc["refreshToken"].toObject(), token_type::REFRESH_TOKEN);
    sessionRepositoy.get()->setToken(accessToken);
    qDebug()<<"access token: " << accessToken.token;
}

void SessionController::signIn(const QString &email, const QString &password)
{
        sessionRepositoy->signIn(email, password);
}


