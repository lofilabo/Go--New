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
			onClicked: { two_advance() }
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
		input.text = "From Here"
		console.log(input2.text) 




//		timer1 := time.NewTimer(2 * time.Second)
//
//		<-timer1.C
//		fmt.Println("Timer 1 fired")
//
//		timer2 := time.NewTimer(time.Second)
//		go func() {
//		<-timer2.C
//		fmt.Println("Timer 2 fired")
//		}()
//		stop2 := timer2.Stop()
//		if stop2 {
//		fmt.Println("Timer 2 stopped")
//		}
//
//		time.Sleep(2 * time.Second)


	}

}
