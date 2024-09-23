#include "session.h"





Token* Session::getAccessToken()
{

    return accessToken;
}

Token* Session::getRefreshToken()
{
    return refreshToken;
}

void Session::setAccessToken(const Token&& token)
{
    accessToken = new Token(std::move(token));
}

void Session::refreshAccessToken()
{

}

Session::Session(QObject* parent) : QObject(parent)
{

}

Session* Session::session;
