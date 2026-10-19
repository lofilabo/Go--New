package main

import (
	"os"
	"github.com/therecipe/qt/widgets"
)

func main() {
	app := widgets.NewQApplication(len(os.Args), os.Args)
	window := widgets.NewQMainWindow(nil, 0)
	button := widgets.NewQPushButton2("click", nil)
	button.ConnectClicked(func(bool){
		widgets.QMessageBox_Information(nil, "title", "Hello World", widgets.QMessageBox__Ok, widgets.QMessageBox__Ok)
	})
	window.SetCentralWidget(button)
	window.Show()
	app.Exec()
}
