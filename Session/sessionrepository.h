#ifndef SESSIONREPOSITORY_H
#define SESSIONREPOSITORY_H

#include <QObject>
#include<session.h>
#include<localrepository.h>
#include<remoterepository.h>


class SessionRepository : public QObject
{
    Q_OBJECT
public:
    explicit SessionRepository(QObject *parent = nullptr);

    std::optional<QString>  getAccessToken();
    std::optional<QString>  getRefreshToken();
    void setToken(const Token& token);
    void signIn(const QString& email, const QString& password);


private:

    Session* session;
    LocalRepository localRepo;
    RemoteRepository remoteRepo;

};

#endif // SESSIONREPOSITORY_H
