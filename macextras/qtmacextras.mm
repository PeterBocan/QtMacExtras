#include "qtmacextras.h"
#include <QtMacExtras>

#import <AppKit/AppKit.h>

NSImage* nativeImageIcon(QtMacIcon icon)
{
    NSImage* img = NULL;
    switch (icon)
    {
    case QtMacActionPopupIcon:
            img = [NSImage imageNamed:NSImageNameActionTemplate];
        break;
    case QtMacAddIcon:
            img = [NSImage imageNamed:NSImageNameAddTemplate];
        break;
    case QtMacBluetoothIcon:
            img = [NSImage imageNamed:NSImageNameBluetoothTemplate];
        break;
    case QtMacColumnViewIcon:
            img = [NSImage imageNamed:NSImageNameColumnViewTemplate];
        break;
    case QtMacGoLeftIcon:
            img = [NSImage imageNamed:NSImageNameGoLeftTemplate];
        break;
    case QtMacGoRightIcon:
            img = [NSImage imageNamed:NSImageNameGoRightTemplate];
        break;
    case QtMacIconViewIcon:
            img = [NSImage imageNamed:NSImageNameIconViewTemplate];
        break;
    case QtMacListViewIcon:
            img = [NSImage imageNamed:NSImageNameListViewTemplate];
        break;
    case QtMacLockLockedIcon:
            img = [NSImage imageNamed:NSImageNameLockLockedTemplate];
        break;
    case QtMacLockUnlockedIcon:
            img = [NSImage imageNamed:NSImageNameLockUnlockedTemplate];
        break;
    case QtMacPathViewIcon:
            img = [NSImage imageNamed:NSImageNamePathTemplate];
        break;
    case QtMacQuickLookIcon:
            img = [NSImage imageNamed:NSImageNameQuickLookTemplate];
        break;
    case QtMacRefreshIcon:
            img = [NSImage imageNamed:NSImageNameRefreshTemplate];
        break;
    case QtMacRemoveIcon:
            img = [NSImage imageNamed:NSImageNameRemoveTemplate];
        break;
    case QtMacShareIcon:
            img = [NSImage imageNamed:NSImageNameShareTemplate];
        break;
    case QtMacSlideshowIcon:
            img = [NSImage imageNamed:NSImageNameSlideshowTemplate];
        break;
    case QtMacSmartBadgeIcon:
            img = [NSImage imageNamed:NSImageNameSmartBadgeTemplate];
        break;
    case QtMacStopProgressIcon:
            img = [NSImage imageNamed:NSImageNameStopProgressTemplate];
        break;
    default:
        ;
    }
    return img;
}

NSImage* nativeImageFreestandingIcon(QtMacFreestandingIcon icon)
{
    NSImage* img = NULL;
    switch (icon)
    {
    case QtMacFreestandingFollowLink:
            img = [NSImage imageNamed:NSImageNameFollowLinkFreestandingTemplate];
        break;
    case QtMacFreestandingInvalidData:
            img = [NSImage imageNamed:NSImageNameInvalidDataFreestandingTemplate];
        break;
    case QtMacFreestandingReveal:
            img = [NSImage imageNamed:NSImageNameRevealFreestandingTemplate];
        break;
    case QtMacFreestandingStopProgress:
            img = [NSImage imageNamed:NSImageNameStopProgressFreestandingTemplate];
        break;
    case QtMacFreestandingRefresh:
            img = [NSImage imageNamed:NSImageNameRefreshFreestandingTemplate];
        break;
    default:
        ;
    }
    return img;
}

QIcon nativeIcon(QtMacIcon icon)
{
    NSImage* image = nativeImageIcon(icon);
    if (!image)
        return QIcon();

    QPixmap pixmap = QtMac::fromCGImageRef((CGImageRef)[image CGImageForProposedRect:nil context:nil hints:nil]);
    return QIcon(pixmap);
}

QIcon nativeFreestandingIcon(QtMacFreestandingIcon icon)
{
    NSImage* image = nativeImageFreestandingIcon(icon);
    if (!image)
        return QIcon();

    QPixmap pixmap = QtMac::fromCGImageRef((CGImageRef)[image CGImageForProposedRect:nil context:nil hints:nil]);
    return QIcon(pixmap);
}






