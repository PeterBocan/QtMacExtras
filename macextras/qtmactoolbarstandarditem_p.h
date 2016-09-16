#ifndef QTMACTOOLBARSTANDARDITEM_P_H
#define QTMACTOOLBARSTANDARDITEM_P_H

#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>

class QtMacToolbarSidebarItem;
@interface QtSidebarToggleDelegate : NSObject
{
@public
   QtMacToolbarSidebarItem* button;
}
- (IBAction)buttonClicked:(id)sender;
@end

#endif // QTMACTOOLBARSTANDARDITEM_P_H
