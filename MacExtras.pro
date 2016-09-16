
QT       += core gui gui-private core-private

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets macextras

QMAKE_MAC_SDK = macosx10.12

TARGET = MacExtras
TEMPLATE = app
LIBS += -framework Cocoa -framework AppKit

SOURCES += main.cpp

HEADERS  += \
    macextras/qtmacextras.h \
    macextras/qtmacmainwindow.h \
    macextras/qtmactoolbar.h \
    macextras/qtmactoolbaritem.h \
    macextras/qtmactoolbaritem_p.h \
    macextras/qtmactoolbarbuttonitem.h \
    macextras/qtmactoolbardelegate.h \
    macextras/qtmactoolbar_p.h \
    macextras/qtmactoolbarsearchfield.h \
    macextras/qtmactoolbarstandarditem.h \
    macextras/qtmactoolbarstandarditem_p.h \
    macextras/qtmactoolbarsegmentedcontrol.h \
    macextras/qtmactoolbarpopupbutton.h

OBJECTIVE_SOURCES += \
    macextras/qtmacmainwindow.mm \
    macextras/qtmactoolbar.mm \
    macextras/qtmactoolbaritem.mm \
    macextras/qtmactoolbarbuttonitem.mm \
    macextras/qtmactoolbardelegate.mm \
    macextras/qtmactoolbarsearchfield.mm \
    macextras/qtmactoolbarstandarditem.mm \
    macextras/qtmactoolbarsegmentedcontrol.mm \
    macextras/qtmactoolbarpopupbutton.mm \
    macextras/qtmacextras.mm
