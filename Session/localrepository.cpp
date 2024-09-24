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

void LocalRepository::writeTokens(const QJsonDocument &doc)
{
    QThreadPool pool;

    QFuture<void> future = QtConcurrent::run([=](){
        Token accessToken = Token::fromJson(doc["accessToken"].toObject(), token_type::ACCESS_TOKEN);
        Token refreshToken = Token::fromJson(doc["refreshToken"].toObject(), token_type::REFRESH_TOKEN);
        Session::getInstance()->setAccessToken(accessToken);
        Session::getInstance()->setRefreshToken(refreshToken);
        settings.setValue("refreshToken", Token::toJson(refreshToken).data());
        settings.setValue("accessToken", Token::toJson(accessToken).data());
    }).then([=]{
        emit finishedWritingTokens(SessionState{SessionState::SIGNED_IN, "Signed In"});
    });


}

