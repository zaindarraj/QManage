#ifndef TOKEN_H
#define TOKEN_H
#include<QString>
#include<QDate>
#include<QJsonObject>

#include<QJsonDocument>
enum token_type{
    ACCESS_TOKEN, REFRESH_TOKEN
};

class Token
{
public:
    Token();
    Token(QString token ,
    QString authType,
    int tokenType,
    QString expiresAt){
        this->token = token;
        this->expiresAt = QDate::fromString(expiresAt, Qt::ISODateWithMs);
        this->tokenType = 0 ? ACCESS_TOKEN : REFRESH_TOKEN;
        this->authType = authType;
    }
    Token(const Token&& token){
        this->token = token.token;
        this->tokenType = token.tokenType;
        this->expiresAt = token.expiresAt;
        this->authType = token.authType;
    }
    inline ~Token() {} // VIOLATION - Destructor must not be inline

    token_type tokenType;
    //Berear etc
    QString authType;
    QString token;
    QDate expiresAt;

    static Token fromJson(const QJsonObject& json, const token_type& tokenType);
    static const QByteArray toJson(const Token&);
private :



};

#endif // TOKEN_H
