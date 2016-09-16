#include "qtmacmainwindow.h"
#include "qtmactoolbar.h"

#include <QGuiApplication>
#include <QTimer>
#include <QDebug>

#include <qpa/qplatformnativeinterface.h>
#include <qmacfunctions.h>

#import <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>

QPlatformNativeInterface::NativeResourceForIntegrationFunction resolvePlatformFunction(const QByteArray &functionName)
{
    QPlatformNativeInterface *nativeInterface = QGuiApplication::platformNativeInterface();
    QPlatformNativeInterface::NativeResourceForIntegrationFunction function =
            nativeInterface->nativeResourceFunctionForIntegration(functionName);
    if (!function)
        qWarning() << "Qt could not resolve function" << functionName
                   << "from QGuiApplication::platformNativeInterface()->nativeResourceFunctionForIntegration()";
    return function;
}

QtMacMainWindow::QtMacMainWindow(QWidget *parent)
    : QMainWindow(parent)
{
   NSView* v = (NSView*)winId();
   nativeWindow = [v window];
}

void QtMacMainWindow::setTitlebarHidden(bool hidden)
{
    NSWindowTitleVisibility v = hidden? NSWindowTitleHidden:
                                        NSWindowTitleVisible;
    [nativeWindow setTitleVisibility:v];
}

void QtMacMainWindow::setTitlebarAppearTransparent(bool transparent)
{
    BOOL y = transparent? YES : NO;
    [nativeWindow setTitlebarAppearsTransparent:y];
}

void QtMacMainWindow::setMacToolbar(QtMacToolbar* tb)
{
    toolbar = tb;
    QWindow* window = windowHandle();
    QPlatformNativeInterface::NativeResourceForIntegrationFunction
            function = resolvePlatformFunction("setNSToolbar");
    if (function) {
        typedef void (*SetNSToolbarFunction)(QWindow *window, void *nsToolbar);
        reinterpret_cast<SetNSToolbarFunction>(function)(window, tb->getNativeHandler());
    } else
        QTimer::singleShot(100, this, SLOT(showToolbar_impl())); // ### hackety hack
}

void QtMacMainWindow::showToolbar_impl()
{
    NSToolbar* bar = toolbar->getNativeHandler();
    [nativeWindow setToolbar: bar];
    [nativeWindow setShowsToolbarButton: YES];
}


