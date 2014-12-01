import QtQuick 2.0
import QtQuick.Controls 1.0
import StoreTradeline 1.0

Item {
id: root
width: parent.width
height: 58

property alias item: itemdescr.text
property string previousnetvalue
property string previousvatamount
property alias qty:qty.text
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

        color:mainwindow.fgcolor
    }





    Rectangle{
        anchors.top: parent.top
        width: parent.width/15
        height:parent.height

        anchors.right: parent.right
        //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.bgcolor
        border.color: mainwindow.buttonbgcolor
        Text
        {
            id:qty
            visible:true
            anchors.fill: parent
            color:mainwindow.fgcolor
            //text:modelData.primaryqty

            //cursorVisible: true
            //textFormat: TextEdit.PlainText
            //cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35
            horizontalAlignment: TextEdit.AlignRight
            anchors.rightMargin: 100
            //validator: DoubleValidator{bottom: 0; top: 999.0; decimals: 0; notation: DoubleValidator.StandardNotation }



}
}
}

StoreTradeline{
    id:strmodel
}
Component.onCompleted: {
    invoiceedit.fintrade_inserted.connect(insertHandler)

}

function insertHandler(ftrid) {
    if (qty.text!="0")
    {
    console.log('INSRTENOW  clicked')
    strmodel.setIteid(modelData.id)
    strmodel.setPrice(modelData.price)
    strmodel.setFtrid(ftrid)
    strmodel.setPrimaryqty(qty.text)
    strmodel.setLinevalue(root.previousnetvalue)
    strmodel.setVatamount(root.previousvatamount)
    strmodel.setVatid(modelData.vatid)
    strmodel.insertDb();
    }

}

}
