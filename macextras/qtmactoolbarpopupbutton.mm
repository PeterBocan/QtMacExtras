#include "qtmactoolbarpopupbutton.h"

#import <AppKit/AppKit.h>

QtMacToolbarPopupButton::QtMacToolbarPopupButton(QtMacToolbarPopupButton::ButtonType t, QObject* parent)
    : QtMacToolbarItem(parent)
{
    button = [[NSPopUpButton alloc] init];
    [button setBezelStyle:NSTexturedRoundedBezelStyle];
    if (t == QtMacToolbarPopupButton::ButtonDown)
        [button setPullsDown:YES];
    else
        [button setPullsDown:NO];

    [button sizeToFit];
    NSToolbarItem* item = nativeHandler();
    [item setMinSize:[button frame].size];

    setNativeWidget(button);
}

QtMacToolbarPopupButton::ButtonType QtMacToolbarPopupButton::type() const
{
    return ([button pullsDown] == YES) ? QtMacToolbarPopupButton::ButtonDown
                                       : QtMacToolbarPopupButton::ButtonUp;
}

void QtMacToolbarPopupButton::setButtonIcon(const QIcon& icon)
{
    [button sizeToFit];
    NSToolbarItem* item = nativeHandler();
    [item setMinSize:[button frame].size];
}

void QtMacToolbarPopupButton::addItems(const QVector<QString>& items)
{
    for (QVector<const QString>::iterator it = items.begin();
         it != items.end(); ++it) {
        NSString* s = (*it).toNSString();
        [button addItemWithTitle:s];
    }
    NSSize s = NSMakeSize(45, 25);
    NSToolbarItem* item = nativeHandler();
    [item setMinSize:s];
    [button setFrameSize:s];
}

