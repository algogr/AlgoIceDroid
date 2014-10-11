import QtQuick 2.2
import QtQuick.Controls 1.1
// import QtBluetooth 5.2

ApplicationWindow {
    visible: true
    id:mainwindow
    width: 1000
    height: 700
    title: qsTr("AlgoIceDroid")
    property string bgcolor:"#000000"
    property string fgcolor:"#ffffff"
    property string buttonbgcolor: "#D8D8D8"
    property string selecteddistrict
    property string selectedcustomer
/*
    BluetoothDiscoveryModel {
        id: btModel
        running: true
        discoveryMode: BluetoothDiscoveryModel.DeviceDiscovery
        onDiscoveryModeChanged: console.log("Discovery mode: " + discoveryMode)
        onServiceDiscovered: console.log("Found new service " + service.deviceAddress + " " + service.deviceName + " " + service.serviceName);
        onDeviceDiscovered: console.log("New device: " + device)
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

*/
    Rectangle{
        anchors.fill: parent
        color: mainwindow.bgcolor


        ListModel {
            id: pageModel


            ListElement {
                title: "Πωλήσεις"
                page: "DistrictList.qml"
            }
            ListElement {
                title: "Βοηθητικές Εργασίες"
                //page: "Customers.qml"
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
}
