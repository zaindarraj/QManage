#include "session.h"



const Token& Session::accessToken()
{
return _accessToken;
}

void Session::setAccessToken(const Token& token)
{
        _accessToken = token;
        emit accessTokenChanged(_accessToken);
}

Session::Session(QObject *parent)
    : QObject{parent}
{

}
