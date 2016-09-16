#ifndef QTMACTOOLBARITEM_H
#define QTMACTOOLBARITEM_H

#include <QObject>
#include <QIcon>

Q_FORWARD_DECLARE_OBJC_CLASS(NSView);
Q_FORWARD_DECLARE_OBJC_CLASS(NSToolbarItem);

class QtMacToolbarItemPrivate;
class QtMacToolbarItem : public QObject
{
    Q_OBJECT
public:
    enum VisibilityPriority {
        PriorityStandard = 0,
        PriorityLow = -1000,
        PriorityHigh = 1000,
        PriorityUser = 2000
    };

    explicit QtMacToolbarItem(QObject *parent = 0);

    virtual~ QtMacToolbarItem();

    bool isSelectable() const;
    void setSelectable(bool selectable);

    void setEnabled(bool enabled);
    bool isEnabled() const;

    QIcon icon() const;
    void setIcon(const QIcon& image);

    QString tooltip() const;
    void setTooltip(const QString& tooltip);

    QString label() const;
    void setLabel(const QString& label);

    void setVisibilityPriority(VisibilityPriority pr);
    VisibilityPriority visibilityPriority() const;

    NSToolbarItem* nativeHandler() const;
public slots:

protected:
    void setNativeWidget(NSView*);

    enum BuiltInType { BuiltInFlexibleSpace, BuiltInSpace,
                       BuiltInSeparator, BuiltInToggleSidebar };
    QtMacToolbarItem(BuiltInType t, QObject* parent = 0);
private:
    friend class QtMacToolbarPrivate;
    Q_DECLARE_PRIVATE(QtMacToolbarItem)
};

#endif // QTMACTOOLBARITEM_H
