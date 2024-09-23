#include "session.h"





const QString Session::getAccessToken()
{

    return accessToken->token;
}

const QString Session::getRefreshToken()
{
    return refreshToken->token;
}

void Session::refreshAccessToken()
{
    if(!refreshing){
        //make sure no other thread got to the variable at the same time as this one
        if(refrshingMutex.tryLock()){
                refreshing = true;
                //Do the refresh request
        }

    }
}

Session::Session(QObject* parent) : QObject(parent)
{

}

Session* Session::session;
