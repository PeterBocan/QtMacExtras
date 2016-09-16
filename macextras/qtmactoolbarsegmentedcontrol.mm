#include "qtmactoolbarsegmentedcontrol.h"
#include <QDebug>

#import <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>

@interface QtMacToolbarSegmentedControlDelegate : NSObject
{
@public
    NSSegmentedControl* nativeControl;
    QtMacToolbarSegmentedControl* control;
}
-(void) install;
-(IBAction)selected: (id)sender;
@end

QtMacToolbarSegmentedControl::QtMacToolbarSegmentedControl(QObject* parent)
    : QtMacToolbarItem (parent)
{
    setEnabled(true);
    setSelectable(true);
    control = [[NSSegmentedControl alloc] init];
    [control setSegmentStyle:NSSegmentStyleSeparated];
    QtMacToolbarSegmentedControlDelegate* delegate = [[[QtMacToolbarSegmentedControlDelegate alloc] init] autorelease];
    delegate->control = this;
    delegate->nativeControl = control;
    [delegate install];
    setNativeWidget(control);
}

void QtMacToolbarSegmentedControl::setSegmentedStyle(QtMacToolbarSegmentedControl::Style s)
{
    NSSegmentStyle style = (s == QtMacToolbarSegmentedControl::StyleSeparated)?
                NSSegmentStyleSeparated : NSSegmentStyleTexturedSquare;
    [control setSegmentStyle:style];
}

QtMacToolbarSegmentedControl::Style QtMacToolbarSegmentedControl::segmentedStyle() const
{
    NSSegmentStyle s = [control segmentStyle];
    return (s == NSSegmentStyleSeparated)? QtMacToolbarSegmentedControl::StyleSeparated:
        QtMacToolbarSegmentedControl::StyleTexturedSquare;
}

void QtMacToolbarSegmentedControl::setSegmentsCount(int count)
{
    [control setSegmentCount:count];
    [control sizeToFit];
}

void QtMacToolbarSegmentedControl::setSegmentLabel(int idx, const QString& label)
{
    NSString* s = label.toNSString();
    [control setLabel:s forSegment:idx];
}

void QtMacToolbarSegmentedControl::setSegmentWidth(int w)
{
    NSInteger max = [control segmentCount];
    for (NSInteger i = 0; i < max; ++i)
        [control setWidth: (CGFloat)w forSegment:i];
    NSToolbarItem* item = nativeHandler();
    NSSize size = [control frame].size;
    size.width *= max+1;
    [item setMinSize: size];
    [item setMaxSize: size];
}

void QtMacToolbarSegmentedControl::setSegmentTooltip(int idx, const QString& tooltip)
{

}

@implementation QtMacToolbarSegmentedControlDelegate

-(void)install
{
    [nativeControl setTarget:self];
    [nativeControl setAction:@selector(selected:)];
}

-(IBAction)selected: (id)sender
{
    qDebug() << "helloo" << endl;
}

@end
