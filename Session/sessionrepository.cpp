#include "sessionrepository.h"

SessionRepository::SessionRepository(QObject *parent)
    : QObject{parent}
{
    qDebug() <<"Man";
    session = Session::getInstance();
    connect(&localRepo, &LocalRepository::finishedWritingTokens, this,[=](SessionState state){
        emit sessionState(state);
    });
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

std::optional<QString> SessionRepository::getRefreshToken()
{
    if(session->getAccessToken()){
        return session->getRefreshToken()->token;
    }
    if(localRepo.getRefreshToken().has_value()){
        session->setRefreshToken(localRepo.getRefreshToken().value());
        return session->getRefreshToken()->token;

    }
    return {};
}



void SessionRepository::signIn(const QString &email, const QString &password)
{
  QNetworkReply* reply = remoteRepo.signIn(email,password);
  connect(reply, &QNetworkReply::finished, this ,[=]() {
      QByteArray response = reply->readAll();
      QJsonDocument jsonDoc = QJsonDocument::fromJson(response);

      if(reply->error() == QNetworkReply::NoError)
      {

          if(jsonDoc["accessToken"].isNull()){
              //emite error
              emit sessionState(SessionState{
                                    SessionState::CONNECTION_ERROR,
                                    "Wrong Email/Password"
                                });
          }else{
              localRepo.writeTokens(jsonDoc);
          }
      }
      else // handle error
      {
          const QString message = jsonDoc["errors"][0]["message"].toString();

          if(!message.isEmpty()){
              emit sessionState(SessionState{
                                    SessionState::CONNECTION_ERROR,
                                    message
                                });
          }else{
              emit sessionState(SessionState{
                                    SessionState::CONNECTION_ERROR,
                                    "Something went wrong, check your internet connection"
                                });
          }

      }
      reply->deleteLater();
  });


}

