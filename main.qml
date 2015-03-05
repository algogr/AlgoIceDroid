import QtQuick 2.0
import QtQuick.Controls 1.0


import QtBluetooth 5.0
import Btmanage 1.0
import QBluetoothSocket 1.0


ApplicationWindow {
    visible: true
    id:mainwindow
    width: 1000
    height: 700
    title: qsTr("AlgoIceDroid")

    property string bgcolor:"#000000"
    property string fgcolor:"#FFFFFF"
    property string buttonbgcolor: "#D8D8D8"
    property string colorbuttonbgcolor: "#000000"
    property string captionfgcolor: "#33FF33"
    property string captionbgcolor: "#333333"
    property string columnlistcolor: "red"
    property string cashopeningcolor:"DarkTurquoise"
    property string cashincomecolor:"LimeGreen "
    property string cashexpensescolor:"red"

    //property string radiobgcolor:"#92C591"
    property string selectedroute
    property string selectedcustomer
    property string salesmanid
    property string selecteditem

    property alias bt: btmgr



    BluetoothDiscoveryModel {
        id: btModel
        running: true
        discoveryMode: BluetoothDiscoveryModel.DeviceDiscovery
        onDiscoveryModeChanged: console.log("Discovery mode: " + discoveryMode)
        onServiceDiscovered: console.log("Found new service " + service.deviceAddress + " " + service.deviceName + " " + service.serviceName+ " " + service.uuid);
        onDeviceDiscovered: {
                      console.log("New device: " + device)

                      //btmgr.connecttoprinter(device)
        }
        onErrorChanged: {
                switch (btModel.error) {
                case BluetoothDiscoveryModel.PoweredOffError:
                    console.log("Error: Bluetooth device not turned on"); break;
                case BluetoothDiscoveryModel.InputOutputError:
                    console.log("Error: Bluetooth I/O Error"); break;
                case BluetoothDiscoveryModel.NoError:
                    break;
                default:
                    console.log("Error: Unknown Error"); break;
                }
        }
   }


    Rectangle{
        anchors.fill: parent
        color: mainwindow.bgcolor
        focus:true
        Keys.onReleased: {
            //if(event.key == Qt.Key_Back)
            console.log(event.key)
        }
        ListModel {
            id: pageModel


            ListElement {
                title: "Πωλήσεις"
                page: "RouteList.qml"
            }

            ListElement {
                title: "Ταμείο"
                page: "Cash.qml"
            }

            ListElement {
                title: "Αναφορές"
                page: "Reports.qml"
            }
            ListElement {
                title: "Βοηθητικές Εργασίες"
                page: "Comm.qml"
            }
                    }

}

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Item {
            width: parent.width
            height: parent.height
            ListView {
                model: pageModel
                anchors.fill: parent
                delegate: SimpleListDelegate {
                    name: title
                    color: mainwindow.fgcolor
                    onClicked:
                    {

                        stackView.push(Qt.resolvedUrl(page))

                    }
                }
            }
        }
    }
    onClosing: {
            console.log("CLOSING")
           close.accepted = false
            //mainwindow.showFullScreen()


       }
    onActiveFocusItemChanged: {
        console.log("ACTIVEFOCUS")
    }

    onVisibleChanged: {
        console.log("VISIBLECHANGED")
    }

    onWindowStateChanged: {
        console.log("STATECHANGED")
    }


    Btmanage{
        id:btmgr
    }





}
