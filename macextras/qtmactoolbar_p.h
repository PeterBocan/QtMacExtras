#ifndef QTMACTOOLBAR_P_H
#define QTMACTOOLBAR_P_H

#import <AppKit/AppKit.h>

#include <QtCore/private/qobject_p.h>
#include <QtCore/QList>

#include "qtmactoolbaritem.h"
#include "qtmactoolbar.h"

class QtMacToolbarPrivate : public QObjectPrivate
{
public:
    QtMacToolbarPrivate();
    virtual ~QtMacToolbarPrivate();
    void itemClicked(NSToolbarItem*);

    static NSString* getItemIdentifier(const QtMacToolbarItem* item);
    static NSMutableArray* getIdentifiers(const QList<QtMacToolbarItem*> &items,
                                   bool cullUnselectable);

    NSToolbar* toolbar;
    NSView* windowView;
    QList<QtMacToolbarItem*> items;
    QList<QtMacToolbarItem*> allowedItems;
    Q_DECLARE_PUBLIC(QtMacToolbar)
};

#endif // QTMACTOOLBAR_P_H
