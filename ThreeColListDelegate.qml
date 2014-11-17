import QtQuick 2.1

Item {
    id: root
    width: parent.width
    height: 88
    property alias name: textitem.text
    property alias color: textitem.color
    property alias attr1: textitem1.text
    property alias color1: textitem1.color
    property alias attr2: textitem2.text
    property alias color2: textitem2.color
    signal clicked

    Rectangle {
        anchors.fill: parent
        color: mainwindow.bgcolor
        visible: mouse.pressed
    }

    Text {
        id: textitem
        //color: mainwindow.fgcolor
        font.pixelSize: parent.width/25
        width:parent.width/4
        text: modelData
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        //anchors.right: textitem1.left
        anchors.leftMargin: 30
    }

    Text {
        id: textitem1
        //color: mainwindow.fgcolor
        font.pixelSize: parent.width/25
        width:parent.width/4
        text: modelData
        horizontalAlignment: Text.AlignRight
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: textitem.right
        anchors.right: textitem2.left
        anchors.leftMargin: 10
        anchors.rightMargin: 10
    }

    Text {
        id: textitem2
        //color: mainwindow.fgcolor
        font.pixelSize: parent.width/25
        width:parent.width/4
        text: modelData
        horizontalAlignment: Text.AlignRight
        anchors.verticalCenter: parent.verticalCenter
        //anchors.left: textitem1.right
        anchors.right: img.left
        anchors.leftMargin: 10
        anchors.rightMargin: 10

    }

    Rectangle {
        id: sep
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 15
        height: 1
        color: mainwindow.bgcolor
    }

    Image {
        id:img
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "images/general/navigation_next_item.png"

    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: root.clicked()


    }
}