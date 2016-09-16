#ifndef QTMACTOOLBARFLEXIBLESPACE_H
#define QTMACTOOLBARFLEXIBLESPACE_H

#include "qtmactoolbaritem.h"

class QtMacToolbarFlexibleSpace : public QtMacToolbarItem
{
public:
    QtMacToolbarFlexibleSpace(QObject* parent = 0);
};

class QtMacToolbarSpaceItem : public QtMacToolbarItem
{
public:
    QtMacToolbarSpaceItem(QObject* parent = 0);
};

class QtMacToolbarSeparatorItem : public QtMacToolbarItem
{
public:
    QtMacToolbarSeparatorItem(QObject* parent = 0);
};

Q_FORWARD_DECLARE_OBJC_CLASS(QtSidebarToggleDelegate);
class QtMacToolbarSidebarItem : public QtMacToolbarItem
{
    Q_OBJECT
public:
    QtMacToolbarSidebarItem(QObject* parent = 0);
signals:
    void pressed();
private:
    QtSidebarToggleDelegate* delegate;
};

#endif // QTMACTOOLBARFLEXIBLESPACE_H
