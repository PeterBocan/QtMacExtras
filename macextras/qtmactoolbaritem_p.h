#ifndef QTMACTOOLBARITEM_P_H
#define QTMACTOOLBARITEM_P_H

#include <QtCore/private/qobject_p.h>

#import <AppKit/AppKit.h>

@interface QtToolbarItem : NSToolbarItem
-(void)validate;
@end

class QtMacToolbarItem;
class QtMacToolbarItemPrivate : public QObjectPrivate
{
public:
    QtMacToolbarItemPrivate();
    ~QtMacToolbarItemPrivate();

    void initNativeInterface();
    void initNativeInterface(NSString* id);

    NSString* identifier() const;
    NSString* _id;
    NSToolbarItem* item;
    NSView* widget;

    QString tooltip;
    QString label;
    QIcon icon;
    int type;
    bool selectable;

    Q_DECLARE_PUBLIC(QtMacToolbarItem)
};

#endif // QTMACTOOLBARITEM_P_H
