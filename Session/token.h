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
    inline ~Token() {} // VIOLATION - Destructor must not be inline

    token_type tokenType;
    //Berear etc
    QString authType;
    QString token;
    QDate expiresAt;
private :



};

#endif // TOKEN_H
