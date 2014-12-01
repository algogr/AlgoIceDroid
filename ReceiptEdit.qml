import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.0
import SqlQueryModel 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    id:receiptedit

    width: parent.width
    height: parent.height
    color: mainwindow.bgcolor
    property string ftrid
    property alias customer: customervalue.text



    Text{

        //anchors.top: parent.top

        //width:parent.width
        //height:parent.height/2
        id:titlecomm
        anchors.top: parent.top
        anchors.topMargin: 50
        font.bold: true
        font.pixelSize: 35
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Αιτιολογία:"


    }
    Rectangle{
        id:valuecomm
        width: parent.width*2/3
        height:parent.height/20
        anchors.top: parent.top

        anchors.topMargin: 50
        anchors.left: titlecomm.right
        anchors.right: parent.right
        anchors.rightMargin: 1
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.bgcolor
        border.color: mainwindow.bgcolor
        Text
        {
            id:customervalue
            visible:true
            anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35
            color: mainwindow.fgcolor
            //text:"PAPARIA"
            //horizontalAlignment: TextEdit.AlignLeft
            //validator: DoubleValidator{bottom: -5.0; top: 5.0; decimals: 1; notation: DoubleValidator.StandardNotation }


        }

}
    StringPropertyEdit{
        //width:parent.width
        id:cop
        anchors.top:titlecomm.bottom
        anchors.topMargin: 50
        visible: true
        height: parent.height/8
        title:"Ποσό:"
        value: model.getCashtrnField(ftrid,"amount")
        alignment:TextInput.AlignRight
        onCancelclicked: stackView.pop()
        onOkclicked: ok()
        function ok()
        {
            model.updateCashtrnField(receiptedit.ftrid,"amount",cop.value)
            stackView.pop()
        }
    }




    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }

    SqlQueryModel {
        id: model


    }
}

