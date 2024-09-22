#ifndef TOKEN_H
#define TOKEN_H
#include<QString>
#include<QDate>

enum token_type{
    ACCESS_TOKEN, REFRESH_TOKEN
};

class Token
{
public:
    Token();

private :
    token_type tokenType;
    //Berear etc
    QString authType;
    QString token;
    QDate expiresAt;


};

#endif // TOKEN_H
