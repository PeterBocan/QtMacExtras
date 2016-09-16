#ifndef QTMACTOOLBARSEGMENTEDCONTROL_H
#define QTMACTOOLBARSEGMENTEDCONTROL_H

#include "qtmactoolbaritem.h"

Q_FORWARD_DECLARE_OBJC_CLASS(NSSegmentedControl);

class QtMacToolbarSegmentedControl : public QtMacToolbarItem
{
    Q_OBJECT
public:
    enum Style {
        StyleSeparated,
        StyleTexturedSquare
    };

    QtMacToolbarSegmentedControl(QObject* parent = 0);

    void setSegmentedStyle(Style s);
    Style segmentedStyle() const;

    void setSegmentsCount(int count);
    void setSegmentWidth(int w);
    void setSegmentLabel(int idx, const QString& label);
    void setSegmentTooltip(int idx, const QString& tooltip);
    void setSegmentTag(int idx, int tag);

signals:
    void selected(int);

private:
    NSSegmentedControl* control;
};

#endif // QTMACTOOLBARSEGMENTEDCONTROL_H
