#ifndef SESSION_H
#define SESSION_H

#include <QObject>
#include<token.h>
class Session : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Token accessToken MEMBER _accessToken READ accessToken WRITE setAccessToken NOTIFY accessTokenChanged FINAL)
public:
    static std::optional<Session*> getInstance(){
        if(session == nullptr){
            return {};
        }
          return session;
    }
    static void init(QObject* parent = nullptr){
            session = new Session(parent);
    }
    const Token& accessToken();



signals:
    void accessTokenChanged(const Token& token);

public slots :
    void setAccessToken(const Token& token);


private:
    explicit Session(QObject *parent = nullptr);
    static Session*session;
    Token _accessToken;
    Token refreshToken;
};

#endif // SESSION_H
