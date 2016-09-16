#ifndef QTMACTOOLBARBUTTONITEM_H
#define QTMACTOOLBARBUTTONITEM_H

#include "qtmactoolbaritem.h"


Q_FORWARD_DECLARE_OBJC_CLASS(NSButton);
class QMenu;
class QtMacToolbarButtonItem : public QtMacToolbarItem
{
    Q_OBJECT
public:
    explicit QtMacToolbarButtonItem(QObject* parent = Q_NULLPTR);
    virtual~ QtMacToolbarButtonItem();

    void setButtonMenu(QMenu* menu);
    void setButtonIcon(const QIcon& icon);
    void setButtonLabel(const QString& icon);
signals:
    void pressed();
protected:

private:
    QIcon icn;
    QString label;
    QMenu* menu;
    NSButton* button;
};

#endif // QTMACTOOLBARBUTTONITEM_H
