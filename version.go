package main

import (
	"log"
	"runtime"
	"time"

	"github.com/esiqveland/notify"
	"github.com/godbus/dbus/v5"
)

type Goversion struct {
	Version string `version`
}

type Goversions []Goversion

type Notifier struct {
	conn     *dbus.Conn
	notifier notify.Notifier
	notifID  uint32
	version  string
}

const (
	_versionURL           = "https://golang.org/dl/?mode=json"
	_dlURL                = "https://storage.googleapis.com/golang/"
	_checkIntervalMinutes = 3600 * time.Minute
	_expireMils           = 5000
	_appName              = "goup"
	_appIcon              = "applications-accessories"
	_actionUpgrade        = "upgrade"
	_labelUpgrade         = "Upgrade"
	_actionCancel         = "cancel"
	_labelCancel          = "Cancel"
)

func NewNotifier() *Notifier {
	n := Notifier{
		conn: getDbusConn(),
	}

	notifier, err := notify.New(n.conn, notify.WithOnAction(n.onAction))
	if err != nil {
		log.Fatalln("error creating notifier:", err)
	}
	n.notifier = notifier

	return &n
}

func (n *Notifier) Close() {
	n.notifier.Close()
	n.conn.Close()
}

func (n *Notifier) Notify(version string) {
	notif := notify.Notification{
		AppName:    _appName,
		ReplacesID: n.notifID,
		AppIcon:    _appIcon,
		Summary:    "Go version " + version + " available!",
		Body:       "Upgrade Go version?",
		Actions: []string{
			_actionCancel, _labelCancel,
			_actionUpgrade, _labelUpgrade,
		},
		Hints:         map[string]dbus.Variant{},
		ExpireTimeout: int32(_expireMils),
	}

	ID, err := n.notifier.SendNotification(notif)
	if err != nil {
		log.Fatalln("error sending notification:", err)
	}
	n.notifID = ID
}

func (n *Notifier) onAction(action *notify.ActionInvokedSignal) {
	log.Println("action invoked:", action.ID, action.ActionKey)
	switch action.ActionKey {
	case _actionUpgrade:
		log.Println("upgrading to Go version:", n.version)
		download(n.version)
	}
}

func main() {
	notifier := NewNotifier()
	defer notifier.Close()

	for {
		curr, latest := getCurrentVersion(), getLatestVersion()
		if curr != latest {
			notifier.Notify(latest)
		}

		time.Sleep(5 * time.Second)

		//return
	}
}

func getDbusConn() *dbus.Conn {
	conn, err := dbus.SessionBusPrivate()
	if err != nil {
		log.Fatalln("unable to get dbus connection:", err)
	}
	if err = conn.Auth(nil); err != nil {
		log.Fatalln("unable to do dbus connection auth:", err)
	}

	if err = conn.Hello(); err != nil {
		log.Fatalln("unable to get say hello to dbus:", err)
	}

	return conn
}

func download(version string) (string, error) {
	goos := "linux"
	ext := ".tar.gz"
	arch := runtime.GOARCH

	dlURL := _dlURL + version + "." + goos + "-" + arch + ext
	log.Println("will download Go version:", version)
	log.Println("downloading from:", dlURL)

	return "", nil
}

func upgrade(fileLoc string) error {
	log.Println("upgrading Go")
	return nil
}

func getLatestVersion() string {
	version := "x"
	log.Println("latest version:", version)
	return version
}

func getCurrentVersion() string {
	version := ""
	log.Println("current version:", version)
	return version
}
