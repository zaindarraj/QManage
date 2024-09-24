#ifndef LOCALREPOSITORY_H
#define LOCALREPOSITORY_H

#include <QObject>
#include<QSettings>
#include<QJsonDocument>
#include <QtConcurrent/QtConcurrentRun>
#include<token.h>
#include<session.h>
#include<sessionState.h>

class LocalRepository : public QObject
{

    Q_OBJECT
public:
    explicit LocalRepository(QObject *parent = nullptr);
    std::optional<Token> getAccessToken();
    std::optional<Token> getRefreshToken();

signals:

public slots :

    void writeTokens(const QJsonDocument&);


signals :
    void finishedWritingTokens(SessionState state);
private :
    QSettings settings;


};

#endif // LOCALREPOSITORY_H
