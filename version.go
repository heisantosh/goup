package main

import (
	"log"
	"runtime"
	"time"
)

type Goversion struct {
	Version string `version`
}

type Goversions []Goversion

const (
	_versionURL           = "https://golang.org/dl/?mode=json"
	_dlURL                = "https://storage.googleapis.com/golang/"
	_checkIntervalMinutes = 3600 * time.Minute
)

func main() {
	for {
		curr, latest := getCurrentVersion(), getLatestVersion()
		if curr != latest {
			// Send notification
			// If upgrade agreed, download and upgrade
			notif := NewNotification("Go", "Upgrade to new version!")
			notif.AppIcon = "network-wireless"
			if _, err := notif.Show(); err != nil {
				log.Println("error showing notification:", err)
			}

			download(latest)
		}

		return
		// time.Sleep(_checkIntervalMinutes)
	}
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
