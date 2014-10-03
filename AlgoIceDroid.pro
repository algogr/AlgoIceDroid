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

OTHER_FILES +=

deployment.files += algoicedroid.db
deployment.path = /assets/db
INSTALLS += deployment
