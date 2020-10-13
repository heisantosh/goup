package main

import (
	"log"
	"os"

	"github.com/gotk3/gotk3/glib"
	"github.com/gotk3/gotk3/gtk"
)

const (
	_appID = "io.github.heisantosh.goup"
)

func main() {
	app, err := gtk.ApplicationNew(_appID, glib.APPLICATION_FLAGS_NONE)
	if err != nil {
		log.Fatal("unable to create application:", err)
	}

	app.Connect("activate", func() { onActivate(app) })
	os.Exit(app.Run(os.Args))
}

func onActivate(app *gtk.Application) {
	window, err := gtk.ApplicationWindowNew(app)
	if err != nil {
		log.Fatal("unable to create application window:", err)
	}

	// switch button
	switchh, _ := gtk.SwitchNew()
	switchLabel, _ := gtk.LabelNew("Enable checking upgrade")
	switchBox, _ := gtk.BoxNew(gtk.ORIENTATION_HORIZONTAL, 8)
	switchBox.SetHAlign(gtk.ALIGN_CENTER)
	switchBox.Add(switchLabel)
	switchBox.Add(switchh)

	// box
	box, _ := gtk.BoxNew(gtk.ORIENTATION_VERTICAL, 8)
	box.Add(switchBox)

	// grid
	grid, _ := gtk.GridNew()
	grid.SetHAlign(gtk.ALIGN_CENTER)
	grid.Add(box)

	window.SetTitle("Goup")
	window.SetDefaultSize(500, 500)
	window.Add(grid)
	window.ShowAll()
}
