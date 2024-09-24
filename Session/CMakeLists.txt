set(CMAKE_AUTORCC ON)

qt_add_library(Session STATIC)

qt_add_qml_module(Session
URI "Session"
VERSION 1.0
SOURCES sessioncontroller.h sessioncontroller.cpp
SOURCES session.h session.cpp
SOURCES
SOURCES token.h token.cpp
SOURCES sessionrepository.h sessionrepository.cpp
SOURCES
SOURCES localrepository.h localrepository.cpp
SOURCES remoterepository.h remoterepository.cpp
SOURCES accessmanageraccessor.h accessmanageraccessor.cpp
SOURCES sessionState.h
)


target_link_libraries(Session
    PRIVATE Qt6::Quick
)


set(QML_IMPORT_PATH ${CMAKE_SOURCE_DIR}/qml  ${CMAKE_BINARY_DIR}/imports ${CMAKE_BINARY_DIR}/qml CACHE STRING "" FORCE)
