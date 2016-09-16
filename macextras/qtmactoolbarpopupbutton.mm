#include "qtmactoolbarpopupbutton.h"

#include <QtDebug>

#import <AppKit/AppKit.h>

@interface PopupButtonDelegate : NSObject
{
@public
     QtMacToolbarPopupButton* button;
     NSPopUpButton* nativeButton;
}
- (IBAction)selected: (id)sender;
@end

QtMacToolbarPopupButton::QtMacToolbarPopupButton(QtMacToolbarPopupButton::ButtonType t, QObject* parent)
    : QtMacToolbarItem(parent)
{
    button = [[NSPopUpButton alloc] init];
    PopupButtonDelegate* delegate = [[PopupButtonDelegate alloc] init];
    delegate->button = this;
    delegate->nativeButton = button;
    [button setTarget:delegate];
    [button setAction:@selector(selected:)];
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
    CGFloat width = 0.0f;
    NSDictionary* font = @{NSFontAttributeName: [button font]};

    for (QVector<const QString>::iterator it = items.begin();
         it != items.end(); ++it) {
        NSString* s = (*it).toNSString();
        [button addItemWithTitle:s];
        NSSize itemSize = [s sizeWithAttributes:font];
        if (itemSize.width > width)
            width = itemSize.width;
    }

    NSToolbarItem* item = nativeHandler();
    CGFloat height = [item minSize].height;
    width += 20.0f; // voodoo: adjust the controls on the right.
    NSSize newSize = NSMakeSize(width, height);
    [item setMinSize:newSize];
    [button setFrameSize:newSize];
}

@implementation PopupButtonDelegate
-(IBAction)selected:(id)sender
{
    Q_UNUSED(sender);
    NSInteger i = [nativeButton indexOfSelectedItem];
    button->selected((int)i);
}
@end

