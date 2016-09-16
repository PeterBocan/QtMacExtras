#ifndef QTMACTOOLBARPOPUPBUTTON_H
#define QTMACTOOLBARPOPUPBUTTON_H

#include "qtmactoolbaritem.h"

Q_FORWARD_DECLARE_OBJC_CLASS(NSPopUpButton);
class QtMacToolbarPopupButton : public QtMacToolbarItem
{
public:
    enum ButtonType {
        ButtonDown,
        ButtonUp
    };

    explicit QtMacToolbarPopupButton(ButtonType t, QObject* parent = 0);

    ButtonType type() const;
    void setButtonIcon(const QIcon& icon);

    void addItems(const QVector<QString>& item);
signals:
    void selected(int);
private:
    NSPopUpButton* button;
};

#endif // QTMACTOOLBARPOPUPBUTTON_H
