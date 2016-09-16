#ifndef QTMACTOOLBAR_H
#define QTMACTOOLBAR_H

#include <QObject>
#include <QList>

Q_FORWARD_DECLARE_OBJC_CLASS(NSToolbar);

class QtMacToolbarItem;
class QtMacToolbarPrivate;
class QtMacToolbar : public QObject
{
    Q_OBJECT
public:
    enum DisplayMode {
        DisplayDefault,
        DisplayIconAndLabel,
        DisplayIconOnly,
        DisplayLabelOnly
    };

    explicit QtMacToolbar(QObject *parent = 0);

    void setDisplayMode(DisplayMode mode);
    void addItem(QtMacToolbarItem* item);
signals:
    //void pressed();

public slots:

private:
    NSToolbar* getNativeHandler() const;

    friend class QtMacMainWindow;
    Q_DECLARE_PRIVATE(QtMacToolbar);
};

#endif // QTMACTOOLBAR_H
