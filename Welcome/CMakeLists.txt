set(CMAKE_AUTORCC ON)



qt_add_library(welcome_lib STATIC)


qt_add_qml_module(welcome_lib
URI "Welcome"
VERSION 1.0
QML_FILES
QML_FILES qml/Welcome.qml )


set(QML_IMPORT_PATH ${CMAKE_SOURCE_DIR}/qml  ${CMAKE_BINARY_DIR}/imports ${CMAKE_BINARY_DIR}/qml CACHE STRING "" FORCE)
