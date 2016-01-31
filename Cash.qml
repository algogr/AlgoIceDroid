import QtQuick 2.0

Rectangle {
    width: parent.width
    height: parent.height
    color: mainwindow.bgcolor
//*******************************GRID REPLACE***********************
/*
    ListModel {
        id: pageModel


        ListElement {
            title: "Άνοιγμα Ταμείου"
            page: "CashOpening.qml"
        }

        ListElement {
            title: "Έξοδα"
            page: "ExpenseForm.qml"
        }
        ListElement {
            title: "Κατάσταση Ταμείου"
            page: "CashStatus.qml"
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
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        //anchors.fill: parent
        spacing:2
        columns:parent.width/mainwindow.rectanglesize
        Rectangle
        {
            width: mainwindow.rectanglesize
            height:mainwindow.rectanglesize
            border.color: mainwindow.fgcolor
            color:mainwindow.bgcolor
            border.width: 2
            radius:20

            Image{
                width: parent.width
                height: parent.height*8/10
                anchors.top: parent.top
                source:"images/general/cashregister.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackView.push(Qt.resolvedUrl("CashOpening.qml"))
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
                text:"´Ανοιγμα ταμείου"
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
            radius:20

            Image{
                width: parent.width
                height: parent.height*8/10
                anchors.top: parent.top
                source:"images/general/expense.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackView.push(Qt.resolvedUrl("ExpenseForm.qml"))
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
                text:"Έξοδα"
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
            radius:20

            Image{
                width: parent.width
                height: parent.height*8/10
                anchors.top: parent.top
                source:"images/general/cash_report.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackView.push(Qt.resolvedUrl("CashStatus.qml"))
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
                text:"Κατάσταση ταμείου"
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

}
