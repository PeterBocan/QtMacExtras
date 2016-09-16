#ifndef QTMACEXTRAS_H
#define QTMACEXTRAS_H

#include "qtmacmainwindow.h"
#include "qtmactoolbar.h"

#include "qtmactoolbarbuttonitem.h"
#include "qtmactoolbarsearchfield.h"
#include "qtmactoolbarsegmentedcontrol.h"
#include "qtmactoolbarstandarditem.h"
#include "qtmactoolbarpopupbutton.h"

#include <QIcon>

Q_FORWARD_DECLARE_OBJC_CLASS(NSImage);

// https://developer.apple.com/library/prerelease/content/documentation/UserExperience/Conceptual/OSXHIGuidelines/SystemProvided.html#//apple_ref/doc/uid/20000957-CH92-SW1
enum QtMacIcon {
    QtMacNoIcon,
    QtMacQuickLookIcon,
    QtMacBluetoothIcon,
    QtMacSlideshowIcon,
    QtMacActionPopupIcon,
    QtMacSmartBadgeIcon,
    QtMacShareIcon,
    QtMacIconViewIcon,
    QtMacListViewIcon,
    QtMacColumnViewIcon,
    QtMacPathViewIcon,
    QtMacLockLockedIcon,
    QtMacLockUnlockedIcon,
    QtMacGoRightIcon,
    QtMacGoLeftIcon,
    QtMacAddIcon,
    QtMacRemoveIcon,
    QtMacStopProgressIcon,
    QtMacRefreshIcon
};

// https://developer.apple.com/library/prerelease/content/documentation/UserExperience/Conceptual/OSXHIGuidelines/SystemProvided.html#//apple_ref/doc/uid/20000957-CH92-SW1
enum QtMacFreestandingIcon {
    QtMacNoFreestanding,
    QtMacFreestandingInvalidData,
    QtMacFreestandingReveal,
    QtMacFreestandingFollowLink,
    QtMacFreestandingStopProgress,
    QtMacFreestandingRefresh
};

NSImage* nativeImageIcon(QtMacIcon icon);
QIcon nativeIcon(QtMacIcon icon);
NSImage* nativeImageFreestandingIcon(QtMacFreestandingIcon icon);
QIcon nativeFreestandingIcon(QtMacFreestandingIcon icon);

#endif // QTMACEXTRAS_H
