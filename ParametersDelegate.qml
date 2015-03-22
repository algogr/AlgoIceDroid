import QtQuick 2.1
import QtQuick.Controls 1.0


Item {
    id: root
    width: parent.width
    //height: 58
    property alias dlgheight: root.height
    property alias name: textitem.text
    property alias color: textitem.color

    property alias color1: textedit.color
    property alias value: texteditvalue.text

    //signal doychanged(string doytext)
    Rectangle {
        anchors.fill: parent
        color: mainwindow.bgcolor
        //visible: mouse.pressed
    }

    Text {
        id: textitem
        //color: mainwindow.fgcolor
        font.pixelSize: parent.width/32
        width:parent.width/3
        text: modelData
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        //anchors.right: textitem1.left
        anchors.leftMargin: 30
    }
    Rectangle{
        id: textedit
        width:parent.width/2
        height: root.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: textitem.right
        border.width: 10
        border.color: mainwindow.bgcolor
        //anchors.right: img.left
        color:mainwindow.bgcolor
        anchors.leftMargin: 10
    TextEdit {
        id: texteditvalue
        anchors.leftMargin: 15
        //color: mainwindow.fgcolor
        font.pixelSize: parent.width/15
         anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        onTextChanged: text_values()
        function text_values()
        {
            console.log("TEXT VANGED")
            switch (modelData.title)
            {
            case "serverAddress":
                console.log("SEREVER CANGED"+texteditvalue.text)
                parameters.server=texteditvalue.text
                break;
            case "printerMACaddress":
                console.log("PRINTER CANGED"+texteditvalue.text)
                parameters.printer=texteditvalue.text
                break;

    }


    }
    }
    }


    Component.onCompleted: {

    }


}
