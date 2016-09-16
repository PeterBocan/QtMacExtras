#include "qtmactoolbarsearchfield.h"

#import <AppKit/AppKit.h>


QtMacToolbarSearchField::QtMacToolbarSearchField(QObject *parent)
    : QtMacToolbarItem (parent)
{
    searchField = [[NSSearchField alloc] init];

    setNativeWidget(searchField);

    NSToolbarItem* item = nativeHandler();
    [item setMinSize:[searchField frame].size];
    NSSize size = [searchField frame].size;
    size.width *= 2.0;
    [item setMaxSize:size];
}

void QtMacToolbarSearchField::setPlaceholderText(const QString& placeholder)
{
     this->placeholder = placeholder;
     [searchField setPlaceholderString:placeholder.toNSString()];
}


