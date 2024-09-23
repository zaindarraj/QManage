#include "sessionrepository.h"

SessionRepository::SessionRepository(QObject *parent)
    : QObject{parent}
{
    qDebug() <<"Man";
    session = Session::getInstance();
}

std::optional<QString> SessionRepository::getAccessToken()
{
    if(session->getAccessToken()){
        return session->getAccessToken()->token;
    }
    if(localRepo.getAccessToken().has_value()){
        session->setAccessToken(localRepo.getAccessToken().value());
        return session->getAccessToken()->token;

    }
    return {};
}

void SessionRepository::setToken(const Token& token)
{
    if(token.tokenType == token_type::ACCESS_TOKEN){
        localRepo.setAccessToken(token);

    }
}

void SessionRepository::signIn(const QString &email, const QString &password)
{
    remoteRepo.signIn(email,password);

}

