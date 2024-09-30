#include "token.h"

Token::Token()
{

}

Token Token::fromJson(const QJsonObject& json, const token_type& tokenType)
{

    Token token;
    token.token = json["token"].toString();
    token.expiresAt = QDate::fromString(json["expiresAt"].toString(),  Qt::ISODate);
    token.authType = json["type"].toString();
    token.tokenType = tokenType;
    return token;
}

const QByteArray Token::toJson(const Token& token)
{
    QJsonDocument json;
    QJsonObject jsonOb;

    jsonOb["accessToken/token"] = token.token;
    jsonOb["accessToken/expiresAt"] = token.expiresAt.toString();
    jsonOb["accessToken/type"] = token.tokenType;
    json.setObject(jsonOb);
    return json.toJson();
}
