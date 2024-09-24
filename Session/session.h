#ifndef SESSION_H
#define SESSION_H

#include <QObject>
#include<token.h>
#include<QMutex>
#include<QSharedPointer>

class Session : public QObject
{
public:
    inline static Session* getInstance(){
        if(session == nullptr){
            session = new Session();
        }
          return session;
    }

Token* getAccessToken();

Token* getRefreshToken();
void setAccessToken(const Token& token);
void setRefreshToken(const Token& token);

public slots :
void refreshAccessToken();


private:
    Session(QObject* parent = nullptr);
    static Session*session;
    Token* accessToken;
    Token* refreshToken;
    QMutex refrshingMutex;


};

#endif // SESSION_H
