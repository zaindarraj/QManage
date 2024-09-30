#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml/QQmlExtensionPlugin>
#include <Session/sessioncontroller.h>
#include <Session/accessmanageraccessor.h>

int main(int argc, char *argv[])
{
   QGuiApplication app(argc, argv);


   QQmlApplicationEngine engine;


   QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                    &app, []() {
      QCoreApplication::exit(-1);
   },
                    Qt::QueuedConnection);
   AccessManagerAccessor::init(&engine);


   engine.loadFromModule("QManage", "Main");


   return app.exec();
}
