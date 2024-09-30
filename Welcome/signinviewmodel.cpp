#include "signinviewmodel.h"
SignInViewModel::SignInViewModel(QObject *parent)
   : QObject{parent}
{
   connect(&sessionController, &SessionController::sessionReady, this, &SignInViewModel::successfull);
   connect(&sessionController, &SessionController::errorOccured, this, &SignInViewModel::error);
}


const QString &SignInViewModel::email()
{
   return _email;
}


const QString &SignInViewModel::password()
{
   return _password;
}


void SignInViewModel::setEmail(const QString& email)
{
   _email = email;

   emit emailChanged(email);
}


void SignInViewModel::setPassword(const QString& password)
{
   _password = password;
   emit passwordChanged(password);
}


void SignInViewModel::signIn()
{
   sessionController.signIn(_email, _password);
}
