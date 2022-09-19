TEMPLATE = lib
TARGET = QmlFontSelector
QT += qml quick gui
CONFIG += plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.canapos.FontFunctions

# Input
SOURCES += \
        qmlfontselector_plugin.cpp \
        fontselector.cpp

HEADERS += \
        qmlfontselector_plugin.h \
        fontselector.h

DISTFILES = qmldir \
    qml/FontSelector.qml

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) "$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)" "$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}
