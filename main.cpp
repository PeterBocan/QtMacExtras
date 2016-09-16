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
    item->setLabel("ahoooj");
    item->setButtonLabel("A");
    item->setTooltip("tooltip");
    toolbar->addItem(item);
    QObject::connect(item, &QtMacToolbarButtonItem::pressed, [](){
        qDebug() << "item: clicked" << endl;
    });

    QtMacToolbarButtonItem* item2 = new QtMacToolbarButtonItem();
    item2->setLabel("ahoooj");
    item2->setButtonLabel("B");
    item2->setTooltip("tooltip");
    toolbar->addItem(item2);
    QObject::connect(item2, &QtMacToolbarButtonItem::pressed, [](){
       qDebug() << "item2: clicked" << endl;
    });

    QtMacToolbarButtonItem* item3 = new QtMacToolbarButtonItem();
    item3->setLabel("ahoooj");
    item3->setButtonLabel("C");
    item3->setTooltip("tooltip");
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
    segment->setTooltip("Blah");
    toolbar->addItem(segment);
    QObject::connect(segment, &QtMacToolbarSegmentedControl::selected, [](int idx){
        qDebug() << "panel " << idx << " selected." << endl;
    });

    QVector<QString> items = { "A", "B", "C", "D" };
    QtMacToolbarPopupButton* popup = new QtMacToolbarPopupButton(QtMacToolbarPopupButton::ButtonUp);
    popup->addItems(items);
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


