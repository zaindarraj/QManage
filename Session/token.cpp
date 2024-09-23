#include "token.h"

Token::Token()
{

}

Token Token::fromJson(const QJsonObject& json, const token_type& tokenType)
{

    Token token;
    token.token = json["token"].toString();
    token.expiresAt = QDate::fromString(json["expiresAt"].toString(),  Qt::ISODateWithMs);
    token.authType = json["type"].toString();
    token.tokenType = tokenType;
    return token;
}

const QJsonObject Token::toJson(const Token& token)
{
    QJsonObject json;
    json["accessToken/token"] = token.token;
    json["accessToken/expiresAt"] = token.expiresAt.toString();
    json["accessToken/type"] = token.tokenType;
    return json;
}
