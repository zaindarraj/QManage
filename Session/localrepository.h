#ifndef LOCALREPOSITORY_H
#define LOCALREPOSITORY_H

#include <QObject>
#include<QSettings>
#include<token.h>
class LocalRepository : public QObject
{
    Q_OBJECT
public:
    explicit LocalRepository(QObject *parent = nullptr);
    std::optional<Token> getAccessToken();
    std::optional<Token> getRefreshToken();
    void setAccessToken(const Token&);

signals:


private :
    QSettings settings;


};

#endif // LOCALREPOSITORY_H
