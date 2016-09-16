// #include "mainwindow.h"

#include "macextras/qtmacextras.h"
#include <QApplication>
#include <QMessageBox>
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QtMacMainWindow window;
    window.resize(800, 600);
    window.setUnifiedTitleAndToolBarOnMac(true);
    window.setTitlebarHidden(true);

    QtMacToolbar* toolbar = new QtMacToolbar();
    /*
    QtMacToolbarSidebarItem* sidebar = new QtMacToolbarSidebarItem();
    sidebar->setTooltip("Sidebar");
    toolbar->addItem(sidebar);
    */

    QtMacToolbarSpaceItem* space = new QtMacToolbarSpaceItem();
    toolbar->addItem(space);

    QtMacToolbarButtonItem* item = new QtMacToolbarButtonItem();
    item->setLabel("Button 1");
    item->setButtonLabel("Button 1");
    item->setTooltip("Button 1 Tooltip");
    toolbar->addItem(item);
    QObject::connect(item, &QtMacToolbarButtonItem::pressed, [](){
        qDebug() << "item: clicked" << endl;
    });

    QtMacToolbarButtonItem* item2 = new QtMacToolbarButtonItem();
    item2->setLabel("Button 2");
    item2->setButtonLabel("Button 2");
    item2->setTooltip("Button 2 Tooltip");
    toolbar->addItem(item2);
    QObject::connect(item2, &QtMacToolbarButtonItem::pressed, [](){
       qDebug() << "item2: clicked" << endl;
    });

    QtMacToolbarButtonItem* item3 = new QtMacToolbarButtonItem();
    item3->setLabel("Button 3");
    item3->setButtonLabel("Button 3");
    item3->setTooltip("Button 3 Tooltip");
    toolbar->addItem(item3);
    QObject::connect(item3, &QtMacToolbarButtonItem::pressed, [](){
       qDebug() << "item3: clicked" << endl;
    });

    QtMacToolbarSegmentedControl* segment = new QtMacToolbarSegmentedControl();
    segment->setSegmentedStyle(QtMacToolbarSegmentedControl::StyleTexturedSquare);
    segment->setSegmentsCount(3);
    segment->setSegmentWidth(30);
    segment->setSegmentLabel(0, "A");
    segment->setSegmentLabel(1, "B");
    segment->setSegmentLabel(2, "C");
    segment->setTooltip("Segmented Tooltip");
    toolbar->addItem(segment);
    QObject::connect(segment, &QtMacToolbarSegmentedControl::selected, [](int idx){
        qDebug() << "panel " << idx << " selected." << endl;
    });

    QVector<QString> items = { "Item 1", "Item 2", "Item 3", "Item 4" };
    QtMacToolbarPopupButton* popup = new QtMacToolbarPopupButton(QtMacToolbarPopupButton::ButtonUp);
    popup->addItems(items);
    popup->setLabel("Popup button");
    toolbar->addItem(popup);

    QtMacToolbarFlexibleSpace* flexible = new QtMacToolbarFlexibleSpace();
    toolbar->addItem(flexible);

    /* TODO:
    QtMacToolbarSearchField* item4 = new QtMacToolbarSearchField();
    item4->setPlaceholderText("Search");
    toolbar->addItem(item4);
    */

    window.setMacToolbar(toolbar);
    window.show();

    return app.exec();
}


