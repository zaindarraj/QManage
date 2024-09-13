#ifndef SPLASHSCREENCONTROLLER_H
#define SPLASHSCREENCONTROLLER_H

#include <QObject>
#include <QQmlEngine>
#include <QCoreApplication>
class SplashScreenController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit SplashScreenController(QObject *parent = nullptr);
    Q_INVOKABLE void removeSplashScreen();

signals:

public slots:

};

#endif // SPLASHSCREENCONTROLLER_H
