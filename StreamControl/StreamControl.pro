#-------------------------------------------------
#
# Project created by QtCreator 2012-01-06T07:56:02
#
#-------------------------------------------------
QT       += core gui xml widgets network script
TARGET = StreamControl
TEMPLATE = app
SOURCES += *.cpp \
    $$files(o2/*.cpp) \
    $$files(dialogs/*.cpp) \
    $$files(widgets/*.cpp)
HEADERS  += *.h \
    $$files(o2/*.h) \
    $$files(dialogs/*.h) \
    $$files(widgets/*.h)
FORMS    += \
    configwindow.ui
RESOURCES += \
    resources.qrc
RC_FILE = streamcontrol.rc
OTHER_FILES += \
    o2/o2.pri

# macOS specific settings
macx {
    LIBS += -framework Carbon
    
    # Ensure app bundle is properly created
    CONFIG += app_bundle
    
    # Set app bundle information
    QMAKE_INFO_PLIST = Info.plist
    
    # Bundle identifier
    QMAKE_TARGET_BUNDLE_PREFIX = com.yourdomain
    
    # Icon file will be set if the file exists
    exists($PWD/streamcontrol.icns) {
        ICON = streamcontrol.icns
    }
    
    # Specify which frameworks to include
    QMAKE_LFLAGS_SONAME = -Wl,-install_name,@executable_path/../Frameworks/
    
    # Ensure frameworks are copied to app bundle
    QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.14
}

win32 {
    LIBS += -luser32
}

CONFIG(release, debug|release):DEFINES += QT_NO_DEBUG_OUTPUT
