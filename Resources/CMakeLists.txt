set(CMAKE_AUTORCC ON)



qt_add_library(resources_lib STATIC)


qt_add_qml_module(resources_lib
URI "Resources"
VERSION 1.0
RESOURCES
QML_FILES
QML_FILES

)

qt_add_resources(resources_lib "img"
    PREFIX "/"
    FILES insta.png o.jpg
)


set(QML_IMPORT_PATH ${CMAKE_SOURCE_DIR}/qml  ${CMAKE_BINARY_DIR}/imports ${CMAKE_BINARY_DIR}/qml CACHE STRING "" FORCE)
