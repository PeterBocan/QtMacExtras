#include "qtmactoolbardelegate.h"
#include "qtmactoolbaritem.h"

#include <QString>

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@implementation QtMacToolbarDelegate

- (NSArray *)toolbarDefaultItemIdentifiers:(NSToolbar*)toolbar
{
    Q_UNUSED(toolbar);
    return (NSArray*)toolbarPrivate->getIdentifiers(toolbarPrivate->items, false);
}

- (NSArray *)toolbarAllowedItemIdentifiers:(NSToolbar*)toolbar
{
    Q_UNUSED(toolbar);
    return (NSArray*)toolbarPrivate->getIdentifiers(toolbarPrivate->allowedItems, false);
}

- (NSArray *)toolbarSelectableItemIdentifiers: (NSToolbar *)toolbar
{
    Q_UNUSED(toolbar);
    NSMutableArray *array = toolbarPrivate->getIdentifiers(toolbarPrivate->items, true);
    [array addObjectsFromArray:toolbarPrivate->getIdentifiers(toolbarPrivate->allowedItems, true)];
    return (NSArray*)array;
}

- (NSToolbarItem *) toolbar: (NSToolbar *)toolbar
      itemForItemIdentifier: (NSString *) itemIdentifier
  willBeInsertedIntoToolbar: (BOOL) willBeInserted
{
    Q_UNUSED(toolbar);
    Q_UNUSED(willBeInserted);
    const QString identifier = QString::fromNSString(itemIdentifier);
    QtMacToolbarItem *toolButton = reinterpret_cast<QtMacToolbarItem *>(identifier.toULongLong()); // string -> unisgned long long -> pointer
    return toolButton->nativeHandler();
}

@end


