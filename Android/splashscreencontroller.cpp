#include "splashscreencontroller.h"

SplashScreenController::SplashScreenController(QObject *parent)
    : QObject{parent}
{

}

void SplashScreenController::removeSplashScreen()
{

#ifdef __ANDROID__
    QNativeInterface::QAndroidApplication::hideSplashScreen(1);
#endif

}
