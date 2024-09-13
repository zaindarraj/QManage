set(CMAKE_AUTORCC ON)


qt_add_library(android_lib STATIC)

qt_add_qml_module(android_lib
URI "Android"
VERSION 1.0
QML_FILES qml/Android.qml
SOURCES splashscreencontroller.h splashscreencontroller.cpp )


set(QML_IMPORT_PATH ${CMAKE_SOURCE_DIR}/qml  ${CMAKE_BINARY_DIR}/imports ${CMAKE_BINARY_DIR}/qml CACHE STRING "" FORCE)
