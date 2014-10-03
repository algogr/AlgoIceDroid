import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Dialogs 1.2


Rectangle {
    id:stringeditbox
    visible: false
    height: parent.height/5
    width: parent.width
    anchors.horizontalCenter: parent.horizontalCenter
    //anchors.verticalCenter: parent.verticalCenter
    border.color: mainwindow.fgcolor
    color:mainwindow.bgcolor
    property alias title: title.text
    property alias value: value.text
    signal okclicked



    Text{

        //anchors.top: parent.top

        //width:parent.width
        //height:parent.height/2
        id:title
        anchors.top: parent.top

        font.bold: true
        font.pixelSize: 35
        width:parent.width/3
        anchors.topMargin: 30
        height:parent.height/3
        //anchors.verticalCenter: parent.verticalCenter
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        color:mainwindow.fgcolor
        //horizontalAlignment: Text.AlignCenter

    }
    Rectangle{
        anchors.top: parent.top
        width: parent.width*2/3
        height:parent.height/3
        anchors.topMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:"white"
        border.color: mainwindow.buttonbgcolor
        TextEdit
        {
            id:value
            anchors.fill: parent
            cursorVisible: true
            textFormat: TextEdit.PlainText
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35
            horizontalAlignment: TextEdit.AlignLeft

        }
    }

    Rectangle{
        id:bt1
        height: parent.height/3
        width: parent.width/3
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:value.bottom
        anchors.bottom: parent.bottom
        border.color: mainwindow.bgcolor
        color:mainwindow.buttonbgcolor
        Text{

            //anchors.top: parent.top

            //width:parent.width
            //height:parent.height/2
            text: "OK"

            font.bold: true
            font.pixelSize: 25
            //anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color:"black"

        }
        MouseArea{
            anchors.fill: parent
            onClicked: stringeditbox.okclicked()




        }

    }

}
