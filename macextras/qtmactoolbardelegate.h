#ifndef QTMACTOOLBARDELEGATE_H
#define QTMACTOOLBARDELEGATE_H

#import <AppKit/AppKit.h>

#include "qtmactoolbar_p.h"

@interface QtMacToolbarDelegate : NSObject<NSToolbarDelegate>
{
@public
    QtMacToolbarPrivate *toolbarPrivate;
}

- (NSToolbarItem *) toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *) itemIdent
                    willBeInsertedIntoToolbar:(BOOL) willBeInserted;
- (NSArray *)toolbarDefaultItemIdentifiers:(NSToolbar*)toolbar;
- (NSArray *)toolbarAllowedItemIdentifiers:(NSToolbar*)toolbar;
- (NSArray *)toolbarSelectableItemIdentifiers:(NSToolbar *)toolbar;
@end

#endif // QTMACTOOLBARDELEGATE_H
