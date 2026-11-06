import QtQuick 2.7			//ApplicationWindow
import QtQuick.Controls 2.1	//Dialog

ApplicationWindow {
	id: window

	visible: true
	title: "Hello QML Example"
	minimumWidth: 600
	minimumHeight: 600
	property var varOne: 0

	QtObject {
	    property var varOne: 0
	}

	Column {
		//anchors.centerIn: parent

		//TextField {
			//id: input
			//anchors.horizontalCenter: parent.horizontalCenter
			//placeholderText: "Write something ..."
		//}

		Button {
			anchors.horizontalCenter: parent.horizontalCenter
			text: "(-)"
			onClicked: {
				dialog.open()
				//dialogInner2.open()
			}
		}
	}

	Dialog {
		id: dialogY
		standardButtons: Dialog.Ok
	}

	//monitorr(){
	//	dialog.img001.x=(img001.x + 5)
	//}

	Dialog {
		id: dialog

		x: (window.width - width) - 20
		y: (window.height - height) - 20

		//contentWidth: window.width * 0.5
		//contentHeight: window.height * 0.25
		contentWidth: 220
		contentHeight: 300
		standardButtons: Dialog.Ok


//  Loader {
//	console.log("Comment....")
//  }


		Button {

			id: button02
			x: dialog.width-100			
			y: 0
			//width: 129
			text: "X"
			//onClicked: dialogY.open()
			onClicked:{

				//  console.log("Comment....")

				varOne = 0

				if(img001.x<80){
				//if(varOne<1){
					img001.x=(img001.x + 5)
					img001.y=(img001.y + 5)
				}else{
					img001.x=0
					img001.y=0
				}



			}
			//onClicked: monitorr()
		}

		Button {

			id: button03
			x: dialog.width-180			
			y: 0
			text: "O"
			onClicked:{
				dialogInner2.open()
			}
		}

		contentItem: Label {
			//text: input.text
		}

		Image {
			id: img020
			source: "anmBetter/317.jpg"
			x: 0
			y: 80	
		}

		Image {
			id: img001
			source: "001.png"
			x: 0
			y: 0	
		}





		Dialog {
			id: dialogInner2

			x: 60
			y: 140
			contentWidth: 60
			contentHeight: 16
			standardButtons: Dialog.Ok
		}




	}
}
