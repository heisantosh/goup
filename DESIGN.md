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


