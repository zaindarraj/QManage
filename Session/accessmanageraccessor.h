#ifndef ACCESSMANAGERACCESSOR_H
#define ACCESSMANAGERACCESSOR_H
#include<QNetworkAccessManager>

class AccessManagerAccessor
{
public:
    AccessManagerAccessor();
    static QNetworkAccessManager* getInstance(){
        qDebug() << manager;
        return manager;
    }

    static void init(QObject* parent){
        manager = new QNetworkAccessManager(parent);
    }

private :
    static QNetworkAccessManager* manager;

};

#endif // ACCESSMANAGERACCESSOR_H
