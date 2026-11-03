//https://stackoverflow.com/questions/41490652/docking-in-qtquick/41520315#41520315

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Window {
        width: 100;
        height: 100;
        visible: false;
        id: wnd

        Rectangle {
            id: greenRect
            anchors.fill: parent
        }

        onClosing: {
            blueRect.state = "docked"
        }

    }

    Item {
        width: 200; height: 100

        Rectangle {
            id: redRect
            anchors.fill: parent
        }

        Rectangle {
            id: blueRect
            width: 50; height: 50
            x: 10; y: 10;
            color: "blue"

            states: [
                State {
                    name: "undocked"
                    ParentChange { target: blueRect; parent: greenRect; x: 10; y: 10 }
                },
                State {
                    name: "docked"
                    ParentChange { target: blueRect; parent: redRect; x: 10; y: 10 }
                }
            ]

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    blueRect.state = "undocked"
                    wnd.visible = true
                }
            }
        }
    }
}
