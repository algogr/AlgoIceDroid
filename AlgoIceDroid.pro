TEMPLATE = app

QT += qml quick widgets sql

SOURCES += main.cpp \
    sqlquerymodel.cpp \
    customer.cpp \
    district.cpp \
    doy.cpp \
    occupation.cpp \
    entitydisplay.cpp

RESOURCES += qml.qrc \
    resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    sqlquerymodel.h \
    customer.h \
    district.h \
    doy.h \
    occupation.h \
    entitydisplay.h

OTHER_FILES += \
    android/AndroidManifest.xml \
    android/version.xml \
    android/res/values-ro/strings.xml \
    android/res/layout/splash.xml \
    android/res/values-rs/strings.xml \
    android/res/values-nb/strings.xml \
    android/res/values-et/strings.xml \
    android/res/values/libs.xml \
    android/res/values/strings.xml \
    android/res/values-ru/strings.xml \
    android/res/values-fa/strings.xml \
    android/res/values-es/strings.xml \
    android/res/values-ja/strings.xml \
    android/res/values-pt-rBR/strings.xml \
    android/res/values-it/strings.xml \
    android/res/values-nl/strings.xml \
    android/res/values-zh-rTW/strings.xml \
    android/res/values-de/strings.xml \
    android/res/values-id/strings.xml \
    android/res/values-zh-rCN/strings.xml \
    android/res/values-pl/strings.xml \
    android/res/values-el/strings.xml \
    android/res/values-ms/strings.xml \
    android/res/values-fr/strings.xml \
    android/src/org/kde/necessitas/ministro/IMinistro.aidl \
    android/src/org/kde/necessitas/ministro/IMinistroCallback.aidl \
    android/src/org/qtproject/qt5/android/bindings/QtActivity.java \
    android/src/org/qtproject/qt5/android/bindings/QtApplication.java

deployment.files += algoicedroid.db
deployment.path = /assets/db
INSTALLS += deployment
