#include "qtmactoolbarbuttonitem.h"

#include <QMenu>

#include <QtMacExtras>
#include <QtDebug>
#include <QUuid>

#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>

@interface NSButtonEventDelegate : NSObject
{
@public
    QtMacToolbarButtonItem* toolbarItem;
}
-(IBAction)buttonClicked: (id)sender;
@end

@implementation NSButtonEventDelegate
-(IBAction)buttonClicked: (id)sender
{
    Q_UNUSED(sender);
    emit toolbarItem->pressed();
}
@end

QtMacToolbarButtonItem::QtMacToolbarButtonItem(QObject* parent)
    : QtMacToolbarItem(parent)
{
    setEnabled(true);
    setSelectable(true);
    QString id = QUuid::createUuid().toString();
    button = [[NSButton alloc] init];

    NSButtonEventDelegate* d = [[[NSButtonEventDelegate alloc] init] autorelease];
    d->toolbarItem = this;

    [button setIdentifier:id.toNSString()];
    [button setBezelStyle:NSTexturedRoundedBezelStyle];
    [button setTarget:d];
    [button setAction:@selector(buttonClicked:)];

    setNativeWidget(button);
}

QtMacToolbarButtonItem::~QtMacToolbarButtonItem()
{
    [button release];
}

void QtMacToolbarButtonItem::setButtonIcon(const QIcon& icon)
{
    icn = icon;
    QPixmap pixmap = icon.pixmap(64, 64);
    [button setImage:QtMac::toNSImage(pixmap)];
    [button sizeToFit];
    /// Needed? ->
    NSToolbarItem* item = nativeHandler();
    NSRect rect = [button frame];
    [item setMinSize:NSMakeSize(NSWidth(rect), NSHeight(rect))];
    [item setMaxSize:NSMakeSize(NSWidth(rect), NSHeight(rect))];
    //NSRect visibleRect = [button visibleRect];
}

void QtMacToolbarButtonItem::setButtonLabel(const QString& label)
{
    this->label = label;
    [button setTitle:label.toNSString()];
    [button sizeToFit];
    /// Needed? ->
    NSToolbarItem* item = nativeHandler();
    NSRect rect = [button frame];
    [item setMinSize:NSMakeSize(NSWidth(rect), NSHeight(rect))];
    [item setMaxSize:NSMakeSize(NSWidth(rect), NSHeight(rect))];
    //NSRect visibleRect = [button visibleRect];
}

void QtMacToolbarButtonItem::setButtonMenu(QMenu* menu)
{
    this->menu = menu;
    [button setMenu:menu->toNSMenu()];
}

