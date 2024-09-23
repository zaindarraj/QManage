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

const QString getAccessToken();
const QString getRefreshToken();
const bool isRefreshing(){
    return refreshing;
}

public slots :
void refreshAccessToken();


private:
    Session(QObject* parent = nullptr);
    static Session*session;
    Token* accessToken;
    Token* refreshToken;
    bool refreshing=false;
    QMutex refrshingMutex;


};

#endif // SESSION_H
