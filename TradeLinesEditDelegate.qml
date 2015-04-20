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
property alias price: price.text
property alias linevalue: linevalue.text

Rectangle{

    width:parent.width
    height: parent.height
    color: mainwindow.bgcolor
    border.width: 1
    border.color: mainwindow.fgcolor


    Rectangle
    {
        id:itr
        width:parent.width*2/3
        anchors.left: parent.left
        anchors.right: arr.left
        border.width: 1
        border.color: mainwindow.buttonbgcolor
        anchors.verticalCenter: parent.verticalCenter
    Text {
        id: itemdescr
        font.pixelSize: parent.width/25
        width:parent.width
        //text: modelData
        anchors.verticalCenter: parent.verticalCenter
        //anchors.right: textitem1.left

        color:mainwindow.fgcolor
    }
    }





    Rectangle{
        id:arr
        anchors.top: parent.top
        //anchors.left:itemdescr.right
        anchors.right: parent.right
        anchors.left: itr.right
        width: parent.width/3
        height:parent.height
        border.width: 1
        border.color: mainwindow.buttonbgcolor
        //anchors.left: parent.left
        //anchors.right: parent.right
        //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.bgcolor

        Rectangle{
            width:parent.width/3
            height:parent.height
            id:qtyr
            anchors.left: parent.left
            anchors.right: pricer.left
            color:mainwindow.bgcolor
            border.color: mainwindow.buttonbgcolor
        Text
        {
            id:qty
            visible:true
            width:parent.width
            height:parent.height
            anchors.fill: parent
            color:mainwindow.fgcolor
            font.pixelSize: 35
            horizontalAlignment: TextEdit.AlignRight



}
        }

        Rectangle{
            width:parent.width/3
            height:parent.height
            id:pricer
            anchors.left: qtyr.right
            anchors.right: linevaluer.left
            border.width: 1
            color:mainwindow.bgcolor
            border.color: mainwindow.buttonbgcolor

        Text
        {
            id:price
            visible:true
            anchors.fill: parent
            color:mainwindow.fgcolor
            width:parent.width
            height:parent.height
            font.pixelSize: 35
            horizontalAlignment: TextEdit.AlignRight
            text:parseFloat(root.price).toFixed(2)



}
        }
        Rectangle{
            width:parent.width/3
            height:parent.height
            id:linevaluer
            border.width: 1
            anchors.left: price.right
            anchors.right: parent.right
            color:mainwindow.bgcolor
            border.color: mainwindow.buttonbgcolor
        Text
        {
            id:linevalue
            visible:true
            anchors.fill: parent
            color:mainwindow.fgcolor
            width:parent.width
            height:parent.height
            font.pixelSize: 35
            horizontalAlignment: TextEdit.AlignRight

}

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
