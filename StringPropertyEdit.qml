import QtQuick 2.0


Rectangle{
    id:stringeditbox
    visible: false
    height: parent.height/5
    width: parent.width
    anchors.horizontalCenter: parent.horizontalCenter
    //anchors.verticalCenter: parent.verticalCenter
    border.color: mainwindow.fgcolor
    color:mainwindow.bgcolor
    property string title: title.text
    property string value: value.text


    Text{

        //anchors.top: parent.top

        //width:parent.width
        //height:parent.height/2
        id:title
        anchors.top: parent.top
        text:"ldkkewq:"
        font.bold: true
        font.pixelSize: 35
        width:parent.width/3
        anchors.topMargin: 30
        height:parent.height/3
        //anchors.verticalCenter: parent.verticalCenter
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        color:mainwindow.fgcolor
        horizontalAlignment: Text.AlignCenter

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
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35
            horizontalAlignment: TextEdit.AlignRight

        }
    }

    Rectangle{
        id:bt1
        height: parent.height/3
        width: parent.width/3
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
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
            onClicked: {
                //model.insertBasket(mainwindow.ordercusid,page.selitemid,te1.text);
                stringedit.visible=false;
            }
        }

    }

}
