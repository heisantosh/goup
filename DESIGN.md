# Design

## Functions
* Install Go for first time
* Go upgrade checker
* Stop/start upgrade checking
* Check interval setting

## UI
* Setting: check interval
* Setting: Alert on/off button
* Setting: Go install location
* Install selected Go version

## Alert on/off
When on start systemd user service. When off stop systemd user service.

## Components
* Settings page
* Installer page
* About page
* systemd service
* Upgrade checker

## Ways to run goup app
* Making entry in ~/.cofig/autostart. Create a .desktop file
https://blog.sleeplessbeastie.eu/2016/04/14/how-to-manage-startup-applications/

Example:
[Desktop Entry]
Type=Application
Name=Seafile
Comment=Seafile applet
Exec=seafile-applet
X-GNOME-Autostart-enabled=true
Hidden=false
NoDisplay=false

X-GNOME-Autostart-enabled - true/false to enable/disable

https://specifications.freedesktop.org/desktop-entry-spec/latest/

* Create a systemd service unit

https://github.com/canonical/dbus.dart/blob/master/example/signals.dart

Notification spec:
https://developer.gnome.org/notification-spec/

flutter lifecycle package:
https://pub.dev/packages/flutter_lifecycle/install

https://api.flutter.dev/flutter/widgets/State/dispose.html

Background execution of Dart code:
https://medium.com/flutter/executing-dart-in-the-background-with-flutter-plugins-and-geofencing-2b3e40a1a124

## Packaging
On packaging flutter desktop linux apps in formats other than snap:
https://github.com/google/flutter-desktop-embedding/issues/76

The directory at `build/linux/release/bundle` can be zipped and shared to run as as standalone app. Run `fluter release linux` for building release for linux.
