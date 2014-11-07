import QtQuick 2.0
import QtQuick.Controls 1.0

Item {
id: root
width: parent.width
height: 58

property alias item: itemdescr.text

Rectangle{

    width:parent.width
    height: parent.height
    color: mainwindow.bgcolor
    border.width: 1
    border.color: mainwindow.fgcolor



    Text {
        id: itemdescr
        font.pixelSize: parent.width/32
        width:parent.width/3
        //text: modelData
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        //anchors.right: textitem1.left
        anchors.leftMargin: 30
        color:mainwindow.fgcolor
    }

    Rectangle {
        id: bt1
        //anchors.left: parent.left
        anchors.right: bt2.left
        //anchors.margins: 15
        height: parent.height
        width:parent.width/15
        //color: mainwindow.bgcolor
        color:mainwindow.colorbuttonbgcolor



    Image {
        id:img1
        anchors.right: parent.right
        //anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "images/general/plus.png"
        fillMode: Image.PreserveAspectFit
        height: parent.height
        width:parent.width
    }

    MouseArea {
        id: mouse1
        anchors.fill: parent
        onClicked: plus_clicked()
        function plus_clicked()
        {
            qty.text=parseInt(qty.text,10)+1
            //var price=parseFloat(modelData.price).toFixed(2)
            invoice.totalvalue=(parseFloat(invoice.totalvalue,10)+parseFloat(modelData.price)).toFixed(2)

        }

    }
}


    Rectangle {
        id: bt2
        //anchors.left: parent.left
        anchors.right: parent.right
        //anchors.margins: 15
        height: parent.height
        width:parent.width/15
        //color: mainwindow.bgcolor
        color:mainwindow.colorbuttonbgcolor



    Image {
        id:img2
        anchors.right: parent.right
        //anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "images/general/minus.png"
        fillMode: Image.PreserveAspectFit
        height: parent.height
        width:parent.width
    }

    MouseArea {
        id: mouse2
        anchors.fill: parent
        onClicked: minus_clicked()
        function minus_clicked()
        {
            qty.text=parseInt(qty.text,10)-1
            //var linevalue=parseInt(qty.text,10)*modelData.price
           invoice.totalvalue=(parseFloat(invoice.totalvalue,10)-parseFloat(modelData.price)).toFixed(2)
        }


    }

}

    Rectangle{
        anchors.top: parent.top
        width: parent.width/15
        height:parent.height

        anchors.right: bt1.left
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:qty
            visible:true
            anchors.fill: parent
            text:"0"

            //cursorVisible: true
            //textFormat: TextEdit.PlainText
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35
            horizontalAlignment: TextEdit.AlignRight
            validator: DoubleValidator{bottom: -999; top: 999.0; decimals: 0; notation: DoubleValidator.StandardNotation }
            //validator:


        }

}



}
}
