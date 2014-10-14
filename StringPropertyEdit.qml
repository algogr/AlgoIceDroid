import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.0



Rectangle {
    id:stringeditbox
    visible: false
    height: parent.height/5
    width: parent.width

    //anchors.verticalCenter: parent.verticalCenter
    border.color: mainwindow.fgcolor
    color:mainwindow.bgcolor
    property alias title: title.text
    property alias value: value.text
    property alias alignment:value.horizontalAlignment

    signal okclicked
    signal cancelclicked


    Text{

        //anchors.top: parent.top

        //width:parent.width
        //height:parent.height/2
        id:title
        anchors.top: parent.top

        font.bold: true
        font.pixelSize: 35
        width:parent.width/3

        height:parent.height/2

        anchors.left: parent.left
        color:mainwindow.fgcolor
        wrapMode: Text.Wrap


    }
    Rectangle{
        anchors.top: parent.top
        width: parent.width*2/3
        height:parent.height/2

        anchors.right: parent.right
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:value
            visible:true
            anchors.fill: parent
            cursorVisible: true
            //textFormat: TextEdit.PlainText
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35
            //horizontalAlignment: TextEdit.AlignLeft
            //validator: DoubleValidator{bottom: -5.0; top: 5.0; decimals: 1; notation: DoubleValidator.StandardNotation }


        }

}

    Rectangle{
        id:bt1
        height: parent.height/2
        width: parent.width/2
        //anchors.bottomMargin: 10

        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:title.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
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
            color:mainwindow.bgcolor

        }
        MouseArea{
            anchors.fill: parent
            onClicked: stringeditbox.okclicked()




        }

    }
    Rectangle{
        id:bt2
        height: parent.height/2
        width: parent.width/2
        //anchors.bottomMargin: 10

        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:title.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        border.color: mainwindow.bgcolor
        color:mainwindow.buttonbgcolor
        Text{

            //anchors.top: parent.top

            //width:parent.width
            //height:parent.height/2
            text: "Ακύρωση"

            font.bold: true
            font.pixelSize: 25
            //anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color:mainwindow.bgcolor

        }
        MouseArea{
            anchors.fill: parent
            onClicked: stringeditbox.cancelclicked()




        }

    }

}
