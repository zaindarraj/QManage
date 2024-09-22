#include "sessioncontroller.h"

SessionController::SessionController(QObject *parent)
    : QObject{parent}
{

   if(Session::getInstance().has_value()){
        session = Session::getInstance().value();
   }{
       //init here may delete this later
       Session::init(parent);
   }
}

Token SessionController::getAccessToken()
{
    return session->getAccessToken();
}
