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
            if (qty.text=="0")
                return;

            qty.text=parseInt(qty.text,10)-1
            //var linevalue=parseInt(qty.text,10)*modelData.price

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
            validator: DoubleValidator{bottom: 0; top: 999.0; decimals: 0; notation: DoubleValidator.StandardNotation }
            onTextChanged: evaluate()
            function evaluate()
            {
                if (qty.text=="")

                    return;


                if(root.previousnetvalue=="")
                    root.previousnetvalue="0";

                if(root.previousvatamount=="")
                                    root.previousvatamount="0";

                invoice.netvalue= (parseFloat(invoice.netvalue,10)-parseFloat(root.previousnetvalue,10)+(parseFloat(modelData.price)*parseInt(qty.text))).toFixed(2)
                //invoice.vatamount= (parseFloat(invoice.vatamount,10)-parseFloat(root.previousvatamount,10)+(parseFloat(modelData.price)*parseInt(qty.text)*parseFloat(modelData.vatid)/100).toFixed(2)
                invoice.vatamount= (parseFloat(invoice.vatamount,10)-parseFloat(root.previousvatamount,10)+(parseFloat(modelData.price)*parseInt(qty.text)*parseFloat(modelData.vatid)/100)).toFixed(2)
                invoice.totalvalue=(parseFloat(invoice.netvalue,10)+parseFloat(invoice.vatamount,10)).toFixed(2)

                root.previousnetvalue= (parseFloat(modelData.price)*parseInt(qty.text)).toFixed(2)
                root.previousvatamount=(parseFloat(modelData.price)*parseInt(qty.text)*parseFloat(modelData.vatid)/100).toFixed(2)
                //fintrade.insert_tradelines(strmodel)
                strmodel.getptr();





}



}
}
}

StoreTradeline{
    id:strmodel
}
Component.onCompleted: {
    invoice.fintrade_inserted.connect(insertHandler)

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
