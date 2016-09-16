#include "qtmactoolbaritem.h"
#include "qtmactoolbaritem_p.h"

#include <QtMacExtras>

#import <AppKit/AppKit.h>

QtMacToolbarItem::QtMacToolbarItem(QObject *parent)
    : QObject(*new QtMacToolbarItemPrivate, parent)
{
    Q_D(QtMacToolbarItem);
    d->initNativeInterface();
}

QtMacToolbarItem::QtMacToolbarItem(BuiltInType t, QObject* parent)
    : QObject(*new QtMacToolbarItemPrivate, parent)
{
    Q_D(QtMacToolbarItem);

    if (t == BuiltInFlexibleSpace)
        d->initNativeInterface(NSToolbarFlexibleSpaceItemIdentifier);
    else if (t == BuiltInSeparator)
        d->initNativeInterface(NSToolbarSeparatorItemIdentifier);
    else if (t == BuiltInSpace)
        d->initNativeInterface(NSToolbarSpaceItemIdentifier);
    else if (t == BuiltInToggleSidebar)
        d->initNativeInterface(NSToolbarToggleSidebarItemIdentifier);
}

QtMacToolbarItem::~QtMacToolbarItem()
{
}

void QtMacToolbarItem::setVisibilityPriority(QtMacToolbarItem::VisibilityPriority p)
{
    Q_D(QtMacToolbarItem);
    [d->item setVisibilityPriority:(NSInteger)p];
}

QtMacToolbarItem::VisibilityPriority QtMacToolbarItem::visibilityPriority() const
{
    Q_D(const QtMacToolbarItem);
    return (QtMacToolbarItem::VisibilityPriority)[d->item visibilityPriority];
}

void QtMacToolbarItem::setIcon(const QIcon &icon)
{
    Q_D(QtMacToolbarItem);
    d->icon = icon;

    QPixmap pixmap = icon.pixmap(64, 64);
    if (pixmap.isNull() == false)
        [d->item setImage:QtMac::toNSImage(pixmap)];
}

QIcon QtMacToolbarItem::icon() const
{
    Q_D(const QtMacToolbarItem);
    return d->icon;
}

void QtMacToolbarItem::setTooltip(const QString& tooltip)
{
    Q_D(QtMacToolbarItem);
    d->tooltip = tooltip;
    [d->item setToolTip:tooltip.toNSString()];
}

QString QtMacToolbarItem::tooltip() const
{
    Q_D(const QtMacToolbarItem);
    return d->tooltip;
}

void QtMacToolbarItem::setLabel(const QString& label)
{
    Q_D(QtMacToolbarItem);
    d->label = label;
    [d->item setLabel:label.toNSString()];
}

QString QtMacToolbarItem::label() const
{
    Q_D(const QtMacToolbarItem);
    return d->label;
}

NSToolbarItem* QtMacToolbarItem::nativeHandler() const
{
    Q_D(const QtMacToolbarItem);
    return d->item;
}

void QtMacToolbarItem::setSelectable(bool selectable)
{
    Q_D(QtMacToolbarItem);
    d->selectable = selectable;
}

bool QtMacToolbarItem::isSelectable() const
{
    Q_D(const QtMacToolbarItem);
    return d->selectable;
}

void QtMacToolbarItem::setEnabled(bool enabled)
{
    Q_D(QtMacToolbarItem);
    BOOL en = enabled? YES : NO;
    [d->item setEnabled:en];
}

bool QtMacToolbarItem::isEnabled() const
{
    Q_D(const QtMacToolbarItem);
    BOOL en = [d->item isEnabled];
    return (en == YES);
}

void QtMacToolbarItem::setNativeWidget(NSView* widget)
{
    Q_D(QtMacToolbarItem);
    d->widget = widget;
    [d->item setView:widget];
}

QtMacToolbarItemPrivate::QtMacToolbarItemPrivate()
{
    selectable = false;
    _id = Q_NULLPTR;
    item = Q_NULLPTR;
}

QtMacToolbarItemPrivate::~QtMacToolbarItemPrivate()
{
    [item release];
}

void QtMacToolbarItemPrivate::initNativeInterface()
{
    NSString* identify = QString::number(qulonglong(q_func())).toNSString();
    item = [[QtToolbarItem alloc] initWithItemIdentifier:identify];
    _id = identify;
}

void QtMacToolbarItemPrivate::initNativeInterface(NSString* id)
{
    item = [[QtToolbarItem alloc] initWithItemIdentifier:id];
    [item setAutovalidates:YES];
    _id = id;
}

NSString* QtMacToolbarItemPrivate::identifier() const
{
    return _id;
}

@implementation QtToolbarItem

-(void)validate
{
    //NSView* view = [self view];
    // Nothing to do.
}

@end

