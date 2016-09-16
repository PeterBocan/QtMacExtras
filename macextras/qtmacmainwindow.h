#ifndef QTMACMAINWINDOW_H
#define QTMACMAINWINDOW_H

#include <QMainWindow>

Q_FORWARD_DECLARE_OBJC_CLASS(NSWindow);

class QtMacToolbar;
class QtMacMainWindow : public QMainWindow
{
    Q_OBJECT
public:
    explicit QtMacMainWindow(QWidget *parent = 0);

    void setTitlebarAppearTransparent(bool transparent);
    void setTitlebarHidden(bool hidden);
    void setMacToolbar(QtMacToolbar* toolbar);

signals:

public slots:

private slots:
    void showToolbar_impl();
private:
    QtMacToolbar* toolbar;
    NSWindow* nativeWindow;
};

#endif // QTMACMAINWINDOW_H
