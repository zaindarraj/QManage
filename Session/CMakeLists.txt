set(CMAKE_AUTORCC ON)

qt_add_library(Session STATIC)

qt_add_qml_module(Session
URI "Session"
VERSION 1.0
SOURCES sessioncontroller.h sessioncontroller.cpp
SOURCES session.h session.cpp
SOURCES
SOURCES token.h token.cpp
)


set(QML_IMPORT_PATH ${CMAKE_SOURCE_DIR}/qml  ${CMAKE_BINARY_DIR}/imports ${CMAKE_BINARY_DIR}/qml CACHE STRING "" FORCE)
