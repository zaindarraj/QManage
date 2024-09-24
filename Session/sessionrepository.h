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

    void signIn(const QString& email, const QString& password);
public slots :
    std::optional<QString>  getAccessToken();
    std::optional<QString>  getRefreshToken();

signals:
    void sessionState(SessionState sessionState);



private:

    Session* session;
    LocalRepository localRepo;
    RemoteRepository remoteRepo;

};

#endif // SESSIONREPOSITORY_H
