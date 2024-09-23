#include "localrepository.h"

LocalRepository::LocalRepository(QObject *parent)
    : QObject{parent}
{

}

std::optional<Token> LocalRepository::getAccessToken()
{
   QString at =  settings.value("accessToken/token", "-1").toString();
   if(at == "-1"){
       return {};
   }
   int tt = settings.value("accessToken/tokenType").toInt();
   QString aut = settings.value("accessToken/authType").toString();
   QString ed = settings.value("accessToken/expirationDate").toString();
   return Token(at, ed,tt, aut);

}

std::optional<Token> LocalRepository::getRefreshToken()
{
    QString at =  settings.value("refreshToken/token", "-1").toString();
    if(at == "-1"){
        return {};
    }
    int tt = settings.value("refreshToken/tokenType").toInt();
    QString aut = settings.value("refreshToken/authType").toString();
    QString ed = settings.value("refreshToken/expirationDate").toString();
    return Token(at, ed,tt, aut);

}

void LocalRepository::setAccessToken(const Token & token)
{

    settings.setValue("accessToken", Token::toJson(token));
}


