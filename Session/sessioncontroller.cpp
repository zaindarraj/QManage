#include "sessioncontroller.h"
#include <token.h>
#include <session.h>
#include <sessionrepository.h>

SessionController::SessionController(QObject *parent)
   : QObject{parent}
{
   sessionRepositoy = QSharedPointer<SessionRepository>(new SessionRepository);
   connect(sessionRepositoy.get(), &SessionRepository::sessionState, this, &SessionController::check);
}


QString SessionController::accessToken()
{
   return sessionRepositoy->getAccessToken().value();
}


QString SessionController::refresherToken()
{
   return sessionRepositoy->getRefreshToken().value();
}


void SessionController::signIn(const QString& email, const QString& password)
{
   sessionRepositoy->signIn(email, password);
}


void SessionController::check(SessionState state)
{
   if (state.state == SessionState::SIGNED_IN)
   {
      //make sure tokens available in run time
      if (sessionRepositoy->getAccessToken().has_value())
      {
         //OK -> emit session ready else error
         emit(sessionReady());
         return;
      }
   }

   qDebug() << "error";
   emit errorOccured(state.message);
}
