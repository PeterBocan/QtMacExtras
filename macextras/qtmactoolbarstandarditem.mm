#include "qtmactoolbarstandarditem.h"
#include "qtmactoolbarstandarditem_p.h"
#include <QDebug>

#import <AppKit/AppKit.h>

QtMacToolbarFlexibleSpace::QtMacToolbarFlexibleSpace(QObject* parent)
    : QtMacToolbarItem (BuiltInFlexibleSpace, parent)
{
    setEnabled(true);
    setSelectable(false);
}

QtMacToolbarSpaceItem::QtMacToolbarSpaceItem(QObject* parent)
    : QtMacToolbarItem (BuiltInSpace, parent)
{
    setEnabled(true);
    setSelectable(false);
}

QtMacToolbarSeparatorItem::QtMacToolbarSeparatorItem(QObject* parent)
    : QtMacToolbarItem (BuiltInSeparator, parent)
{
    setEnabled(true);
    setSelectable(false);
}

QtMacToolbarSidebarItem::QtMacToolbarSidebarItem(QObject* parent)
    : QtMacToolbarItem (BuiltInToggleSidebar, parent)
{
    setEnabled(true);
    setSelectable(true);

    delegate = [[QtSidebarToggleDelegate alloc] init];
    delegate->button = this;
    NSToolbarItem* item = nativeHandler();
    [item setTarget:delegate];
    [item setAction:@selector(buttonClicked:)];
}

@implementation QtSidebarToggleDelegate

-(IBAction)buttonClicked: (id)sender
{
    Q_UNUSED(sender);
    Q_EMIT button->pressed();
}

@end
