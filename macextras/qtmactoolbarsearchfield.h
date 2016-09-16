#ifndef QTMACTOOLBARSEARCHFIELD_H
#define QTMACTOOLBARSEARCHFIELD_H

#include "qtmactoolbaritem.h"

Q_FORWARD_DECLARE_OBJC_CLASS(NSSearchField);

class QtMacToolbarSearchField : public QtMacToolbarItem
{
public:
    QtMacToolbarSearchField(QObject *parent = 0);

    void setPlaceholderText(const QString& placeholder);
    QString placeholderText() const;

signals:
    void entered();
private:
    QString placeholder;
    NSSearchField* searchField;
};

#endif // QTMACTOOLBARSEARCHFIELD_H
