#include "qtmactoolbar.h"
#include "qtmactoolbardelegate.h"
#include "qtmactoolbar_p.h"
#include "qtmactoolbaritem.h"
#include "qtmactoolbaritem_p.h"

#include <QtCore/QUuid>
#include <QtGui/QGuiApplication>
#include <QtGui/QKeyEvent>
#include <QtGui/QMouseEvent>

#import <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>

QtMacToolbar::QtMacToolbar(QObject *parent)
    : QObject(*new QtMacToolbarPrivate(), parent)
{

}

void QtMacToolbar::addItem(QtMacToolbarItem* item)
{
    Q_D(QtMacToolbar);
    d->items.append(item);
    d->allowedItems.append(item);
}

QtMacToolbarPrivate::QtMacToolbarPrivate()
{
    QString s = QUuid::createUuid().toString();
    toolbar = [[NSToolbar alloc] initWithIdentifier:s.toNSString()];
    [toolbar setAllowsExtensionItems:YES];
    [toolbar setAllowsUserCustomization:NO];
    [toolbar setVisible:YES];
    [toolbar setDisplayMode:NSToolbarDisplayModeLabelOnly];

    QtMacToolbarDelegate* delegate = [[QtMacToolbarDelegate alloc] init];
    delegate->toolbarPrivate = this;
    [toolbar setDelegate:delegate];
}

NSToolbar* QtMacToolbar::getNativeHandler() const
{
    Q_D(const QtMacToolbar);
    return d->toolbar;
}

QtMacToolbarPrivate::~QtMacToolbarPrivate()
{
    [[toolbar delegate] release];
    [toolbar release];
}

NSMutableArray* QtMacToolbarPrivate::getIdentifiers(const QList<QtMacToolbarItem*> &items,
                                                    bool cullUnselectable)
{
    NSMutableArray* results = [[NSMutableArray alloc] init];
    foreach (QtMacToolbarItem* item, items) {
        if (cullUnselectable && item->isSelectable() == false)
            continue;
        [results addObject: item->d_func()->identifier()];
    }
    return results;
}

void QtMacToolbarPrivate::itemClicked(NSToolbarItem* p)
{
    QString id = QString::fromNSString([p itemIdentifier]);
    QtMacToolbarItem* item = reinterpret_cast<QtMacToolbarItem*>(id.toULongLong());
    //emit item->activated();
}
