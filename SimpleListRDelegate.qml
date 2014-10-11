import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.2

Item {
    id: root
    width: parent.width
    height: 88
    property alias name: radio.text
    property alias exclusivegroup:radio.exclusiveGroup
    property alias checkeditem: radio.checked

    signal clicked

    Rectangle {
        id:container
        anchors.fill: parent
        color: mainwindow.bgcolor
        //visible: mouse.pressed


    RadioButton {
        id: radio
        //color: mainwindow.fgcolor

        text: modelData

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left

        anchors.fill: parent
        style: RadioButtonStyle
        {
        background: Rectangle {
                    //anchors.fill: parent
                    implicitWidth: parent.width
                    //implicitHeight: 25
                    //border.width: control.activeFocus ? 2 : 1
                    //border.color: "#888"
                    color:mainwindow.bgcolor
                    radius: 4
        }

         label:   Text{
             text:radio.text
            font.pixelSize: container.width/32
            color: mainwindow.fgcolor
            horizontalAlignment: Text.center

        }

        }
        onClicked: root.clicked()

    }

}


}
