#ifndef SIGNINVIEWMODEL_H
#define SIGNINVIEWMODEL_H

#include <QObject>
#include <QQmlEngine>
#include "../Session/sessioncontroller.h"
class SignInViewModel : public QObject
{
   Q_OBJECT
   QML_ELEMENT
   Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged FINAL)
   Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged FINAL)
public:
   explicit SignInViewModel(QObject *parent = nullptr);
   const QString& email();

   const QString& password();

signals:
   void emailChanged(const QString& email);
   void passwordChanged(const QString& password);
   void successfull();
   void error(const QString& message);

public slots:
   void setEmail(const QString& email);
   void setPassword(const QString& password);
   void signIn();



private:
   QString _email;
   QString _password;
   SessionController sessionController;
};

#endif // SIGNINVIEWMODEL_H
