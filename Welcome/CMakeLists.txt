set(CMAKE_AUTORCC ON)



qt_add_library(welcome_lib STATIC)


qt_add_qml_module(welcome_lib
URI "Welcome"
VERSION 1.0
QML_FILES qml/Welcome.qml
QML_FILES qml/MyAnimatedShape.qml
QML_FILES qml/WelcomeLayout.qml
QML_FILES qml/SignInForum.qml
SOURCES
SOURCES
QML_FILES qml/MyMessageBox.qml

)

target_link_libraries(welcome_lib
    PRIVATE resources_libplugin Sessionplugin
)

set(QML_IMPORT_PATH ${CMAKE_SOURCE_DIR}/qml  ${CMAKE_BINARY_DIR}/imports ${CMAKE_BINARY_DIR}/qml CACHE STRING "" FORCE)

