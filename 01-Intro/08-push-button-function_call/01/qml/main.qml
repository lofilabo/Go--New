import QtQuick 2.7			//ApplicationWindow
import QtQuick.Controls 2.1	//Dialog

ApplicationWindow {
	id: window

	visible: true
	title: "Hello QML Example"
	minimumWidth: 500
	minimumHeight: 500

	Column {
		anchors.centerIn: parent

		TextField {
			id: input
	
			anchors.horizontalCenter: parent.horizontalCenter
			placeholderText: "Write something ..."
		}

		TextField {
			id: input2
	
			anchors.horizontalCenter: parent.horizontalCenter
			placeholderText: "Write something ..."
		}

		Button {
			anchors.horizontalCenter: parent.horizontalCenter
			text: "and click me!"
			onClicked: dialog.open()
		}


		Button {
			id: stackLayout
			anchors.horizontalCenter: parent.horizontalCenter
			text: "Decode"

			//onClicked: scrape_vin("hello kitty")
			//onClicked: { stackLayout.one_advance() }
			onClicked: { two_advance() }

			// not needed....?
			//function one_advance() { console.log("Bluuuuuuuuuuuurgh") }

		}

	}

	Dialog {
		id: dialog

		x: (window.width - width) * 0.5
		y: ((window.height - height) * 0.5) - (window.height/3)

		contentWidth: window.width * 0.5
		contentHeight: window.height * 0.25
		standardButtons: Dialog.Ok

		contentItem: Label {
			text: input.text
		}
	}


	function two_advance() { 
		console.log("two_advance -- Blaaaaargh") 
		input.text = "8768"
	}

}
