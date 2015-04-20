import QtQuick 2.0
import SqlQueryModel 1.0


Rectangle {
    width: parent.width
    height: parent.height
    color: mainwindow.bgcolor
//////////***************************GRID   REPLACEMENT************************************
/*
    ListModel {
        id: pageModel


        ListElement {
            title: "Αποθήκη"
            page: "Storefindata.qml"

        }

        ListElement {
            title: "Παραστατικά"
            page: "InvoiceList.qml"
            params:""
        }
        ListElement {
            title: "Υπόλοιπα"
            page: "CustomerBalance.qml"
        }
                }

    ListView{
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
                */
    Grid{
        anchors.fill: parent
        spacing:2
        columns:parent.width/mainwindow.rectanglesize
        Rectangle
        {
            width: mainwindow.rectanglesize
            height:mainwindow.rectanglesize
            border.color: mainwindow.fgcolor
            color:mainwindow.bgcolor
            border.width: 2

            Image{
                width: parent.width
                height: parent.height*8/10
                anchors.top: parent.top
                source:"images/general/inventory.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackView.push(Qt.resolvedUrl("Storefindata.qml"))
                }



            }
            Text
            {
                width:parent.width
                height: parent*2/10

                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.verticalCenter: parent.verticalCenter
                //anchors.baseline: parent.baseline
                text:"´Αποθήκη"
                color:mainwindow.fgcolor
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter

            }

        }


        Rectangle
        {
            width: mainwindow.rectanglesize
            height:mainwindow.rectanglesize
            border.color: mainwindow.fgcolor
            color:mainwindow.bgcolor
            border.width: 2

            Image{
                width: parent.width
                height: parent.height*8/10
                anchors.top: parent.top
                source:"images/general/invoice_list.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackView.push(Qt.resolvedUrl("InvoiceList.qml"))
                }



            }
            Text
            {
                width:parent.width
                height: parent*2/10

                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.verticalCenter: parent.verticalCenter
                //anchors.baseline: parent.baseline
                text:"Παραστατικά"
                color:mainwindow.fgcolor
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter

            }

        }

        Rectangle
        {
            width: mainwindow.rectanglesize
            height:mainwindow.rectanglesize
            border.color: mainwindow.fgcolor
            color:mainwindow.bgcolor
            border.width: 2

            Image{
                width: parent.width
                height: parent.height*8/10
                anchors.top: parent.top
                source:"images/general/ypoloipa.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackView.push(Qt.resolvedUrl("CustomerBalance.qml"))
                }



            }
            Text
            {
                width:parent.width
                height: parent*2/10

                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.verticalCenter: parent.verticalCenter
                //anchors.baseline: parent.baseline
                text:"Yπόλοιπα"
                color:mainwindow.fgcolor
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter

            }

        }



    }

    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }

    SqlQueryModel{
        id:model
    }

}
