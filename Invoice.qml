import QtQuick 2.0
import SqlQueryModel 1.0
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.0



Rectangle {
    width: parent.width
    height: parent.height
    id: invoice
    color: mainwindow.bgcolor
    property alias totalvalue: totalvalue.text
    
    Rectangle{
        id: customer
        width: parent.width;
        height: parent.height/15
        color: mainwindow.captionbgcolor

        Text{
            text:"Πελάτης:"
            height: parent.height
            width:parent.width/3
            color: mainwindow.captionfgcolor
            font.pixelSize: parent.width/32
        }

        Text{
            height: parent.height
            width:parent.width*2/3
            color: mainwindow.captionfgcolor
            font.pixelSize: parent.width/32
            anchors.right: parent.right
            text: model.getCustomerField(mainwindow.selectedcustomer,"name")
        }



        
    }

    ListView{
        model: model.getItemList()
        width:parent.width
        height:parent.height*13/15
        anchors.top:customer.bottom
        delegate: TradeLinesDelegate{
            id:dlg
            item:modelData.description

        }


    }


    Rectangle{
        id: totals
        width: parent.width;
        height: parent.height/15
        color: mainwindow.captionbgcolor
        anchors.bottom: parent.bottom
        border.width: 1
        border.color: mainwindow.fgcolor
        Text{
            text:"Συνολική Αξία:"
            height: parent.height
            width:parent.width/3
            color: mainwindow.captionfgcolor
            font.pixelSize: parent.width/32
        }

        Text{
            id:totalvalue
            height: parent.height
            width:parent.width*2/3
            color: mainwindow.captionfgcolor
            font.pixelSize: parent.width/32
            anchors.right: parent.right
            text: "0.00"
            horizontalAlignment: Text.AlignRight
        }




    }
    
    
    
    SqlQueryModel {
        id: model

    Component.onCompleted: {
      model.opendb();

    }
    }
}
