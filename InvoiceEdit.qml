import QtQuick 2.0
import SqlQueryModel 1.0
import FinTrade 1.0
import Btmanage 1.0
import QBluetoothSocket 1.0
import StoreTradeline 1.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Dialogs 1.1



Rectangle {
    width: parent.width
    height: parent.height
    id: invoiceedit
    color: mainwindow.bgcolor

    property alias netvalue: netvalue.text
    property alias vatamount: vatamount.text
    property alias totalvalue: totalvalue.text
    //property alias cusid
    property string comments
    property string shipaddress
    property int rbfontsize: 15
    property string ftrid
    property int invoicetype: 1 //1-Timologio,2-Pistotiko,3-DA,4-DA
    signal fintrade_inserted(string ftrid)
    signal fintradedelete(string ftrid)




    function insert()
    {
        var currentdate = new Date();
        var datetime =  currentdate.getDate() + "/"
                        + (currentdate.getMonth()+1)  + "/"
                        + currentdate.getFullYear() + " @ "
                        + currentdate.getHours() + ":"
                        + currentdate.getMinutes() + ":"
                        + currentdate.getSeconds();

            fintrade.setFtrdate(datetime)
            fintrade.setDsrid(invoice.invoicetype)
            fintrade.setDsrnumber(fintrade.last_no(invoice.invoicetype))
            fintrade.setCusid(mainwindow.selectedcustomer)
            fintrade.setSalesmanid(mainwindow.salesmanid)
            fintrade.setComments(invoice.comments)
            fintrade.setDeliveryaddress(invoice.shipaddress)
            fintrade.setErpupd("0")
            fintrade.setNetvalue(netvalue.text)
            fintrade.setVatamount(vatamount.text)
            fintrade.setTotamount(totalvalue.text)

            var ftrid=fintrade.insert_db()
            console.log(fintrade.ftrdate)
            invoiceedit.ftrid=ftrid
            invoiceedit.fintrade_inserted(ftrid)


    }

    function deleteftr()
    {
        fintrade.delete_db(invoiceedit.ftrid)

    }




    Rectangle{
        id: customer
        width: parent.width;
        height: parent.height/15
        color: mainwindow.captionbgcolor

        Text{
            text:"Πελάτης:"
            height: parent.height
            width:parent.width/5
            color: mainwindow.captionfgcolor
            font.pixelSize: parent.width/32
        }

        Text{
            height: parent.height
            width:parent.width*3/5
            color: mainwindow.captionfgcolor
            font.pixelSize: parent.width/32
            anchors.right: datet.left
            text: model.getCustomerField(model.getFintradeField(invoiceedit.ftrid,"cusid"),"name")
            elide: Text.ElideRight
        }

        Text{
            id:datet
            height: parent.height
            width:parent.width/5
            color: mainwindow.fgcolor
            font.pixelSize: parent.width/32
            anchors.right: parent.right
            text: {
                var pos=model.getFintradeField(invoiceedit.ftrid,"ftrdate").lastIndexOf("@");
                model.getFintradeField(invoiceedit.ftrid,"ftrdate").slice(0,pos-1);
            }
            horizontalAlignment: Text.AlignRight
        }




    }

    Rectangle{
        id: invoicetype
        width: parent.width
        height: parent.height/15
        color: mainwindow.bgcolor
        anchors.top:customer.bottom


            RowLayout{
                id:test
                anchors.bottom: parent.bottom
                ExclusiveGroup { id: tabPositionGroup }
                        RadioButton {
                            id:btn1
                            style: RadioButtonStyle {


                                    indicator: Rectangle {
                                            //implicitWidth: 16
                                            //implicitHeight: 16
                                            anchors.top:parent.top

                                            width:16
                                            height: 16
                                            radius: 39
                                            border.color: control.activeFocus ? "black" : "grey"
                                            border.width: 1
                                            Rectangle {
                                                anchors.fill: parent
                                                visible: control.checked
                                                color: "black"
                                                radius: 9
                                                anchors.margins: 3
                                            }
                                    }
                                    label: Rectangle{
                                        color:"black"

                                        anchors.top:parent.top
                                        //implicitWidth: invoicetype.width/4
                                        //implicitHeight: 35
                                        width: invoicetype.width/6
                                        //height: invoicetype.height
                                        height:16
                                        radius:39
                                        Text{
                                            text:"Tιμολόγιο"
                                            anchors.fill: parent
                                            color:"white"
                                            font.pixelSize: rbfontsize
                                            font.weight: Font.Bold
                                        }

                                    }
                            }

                            checked: false
                            exclusiveGroup: tabPositionGroup
                            onCheckedChanged: setinvtype()
                            function setinvtype()
                            {
                                if (checked==true)

                                    invoiceedit.invoicetype=1

                            }

                        }

                        RadioButton {
                            id:btn2
                            style: RadioButtonStyle {


                                    indicator: Rectangle {
                                            //implicitWidth: 16
                                            //implicitHeight: 16
                                            anchors.top:parent.top

                                            width:16
                                            height: 16
                                            radius: 39
                                            border.color: control.activeFocus ? "black" : "grey"
                                            border.width: 1
                                            Rectangle {
                                                anchors.fill: parent
                                                visible: control.checked
                                                color: "black"
                                                radius: 9
                                                anchors.margins: 3
                                            }
                                    }
                                    label: Rectangle{
                                        color:"black"

                                        anchors.top:parent.top
                                        //implicitWidth: invoicetype.width/4
                                        //implicitHeight: 35
                                        width: invoicetype.width/6
                                        //height: invoicetype.height
                                        height:16
                                        radius:39
                                        Text{
                                            text:"Πιστωτικό"
                                            anchors.fill: parent
                                            color:"white"
                                            font.pixelSize: rbfontsize
                                            font.weight: Font.Bold
                                        }

                                    }
                            }

                            checked: false
                            exclusiveGroup: tabPositionGroup
                            onCheckedChanged: setinvtype()
                            function setinvtype()
                            {
                                if (checked==true)

                                    invoiceedit.invoicetype=2

                            }

                        }
                        RadioButton {
                            id:btn3
                            style: RadioButtonStyle {


                                    indicator: Rectangle {
                                            //implicitWidth: 16
                                            //implicitHeight: 16
                                            anchors.top:parent.top

                                            width:16
                                            height: 16
                                            radius: 39
                                            border.color: control.activeFocus ? "black" : "grey"
                                            border.width: 1
                                            Rectangle {
                                                anchors.fill: parent
                                                visible: control.checked
                                                color: "black"
                                                radius: 9
                                                anchors.margins: 3
                                            }
                                    }
                                    label: Rectangle{
                                        color:"black"

                                        anchors.top:parent.top
                                        //implicitWidth: invoicetype.width/4
                                        //implicitHeight: 35
                                        width: invoicetype.width/6
                                        //height: invoicetype.height
                                        height:16
                                        radius:39
                                        Text{
                                            text:"Δελτίο Αποστολής"
                                            anchors.fill: parent
                                            color:"white"
                                            font.pixelSize: rbfontsize
                                            font.weight: Font.Bold
                                        }

                                    }
                            }

                            checked: false
                            exclusiveGroup: tabPositionGroup
                            onCheckedChanged: setinvtype()
                            function setinvtype()
                            {
                                if (checked==true)

                                    invoiceedit.invoicetype=3

                            }

                        }
                        RadioButton {
                            id:btn4
                            style: RadioButtonStyle {


                                    indicator: Rectangle {
                                            //implicitWidth: 16
                                            //implicitHeight: 16
                                            anchors.top:parent.top

                                            width:16
                                            height: 16
                                            radius: 39
                                            border.color: control.activeFocus ? "black" : "grey"
                                            border.width: 1
                                            Rectangle {
                                                anchors.fill: parent
                                                visible: control.checked
                                                color: "black"
                                                radius: 9
                                                anchors.margins: 3
                                            }
                                    }
                                    label: Rectangle{
                                        color:"black"

                                        anchors.top:parent.top
                                        //implicitWidth: invoicetype.width/4
                                        //implicitHeight: 35
                                        width: invoicetype.width/6
                                        //height: invoicetype.height
                                        height:16
                                        radius:39
                                        Text{
                                            text:"Δελτίο Επιστροφής"
                                            anchors.fill: parent
                                            color:"white"
                                            font.pixelSize: rbfontsize
                                            font.weight: Font.Bold
                                        }

                                    }
                            }

                            checked: false
                            exclusiveGroup: tabPositionGroup
                            onCheckedChanged: setinvtype()
                            function setinvtype()
                            {
                                if (checked==true)

                                    invoiceedit.invoicetype=4

                            }

                        }

                        RadioButton {
                            id:btn5

                            style: RadioButtonStyle {


                                    indicator: Rectangle {
                                            //implicitWidth: 16
                                            //implicitHeight: 16
                                            anchors.top:parent.top

                                            width:16
                                            height: 16
                                            radius: 39
                                            border.color: control.activeFocus ? "black" : "grey"
                                            border.width: 1
                                            Rectangle {
                                                anchors.fill: parent
                                                visible: control.checked
                                                color: "black"
                                                radius: 9
                                                anchors.margins: 3
                                            }
                                    }
                                    label: Rectangle{
                                        color:"black"

                                        anchors.top:parent.top
                                        //implicitWidth: invoicetype.width/4
                                        //implicitHeight: 35
                                        width: invoicetype.width/6
                                        //height: invoicetype.height
                                        height:16
                                        radius:39
                                        Text{
                                            text:"Παραγγελία"
                                            anchors.fill: parent
                                            color:"white"
                                            font.pixelSize: rbfontsize
                                            font.weight: Font.Bold
                                        }

                                    }
                            }

                            checked: false
                            exclusiveGroup: tabPositionGroup
                            onCheckedChanged: setinvtype()
                            function setinvtype()
                            {
                                if (checked==true)

                                    invoiceedit.invoicetype=5

                            }

                        }

            }
                    }
       // }







    TabView {

        id: tabv1
        clip: true
        tabPosition: Qt.TopEdge
        width:parent.width
        height:parent.height*12/15
        anchors.top:invoicetype.bottom
        anchors.topMargin: 5


        //height: page.height*5/6

        //anchors.top: caption.bottom
        //anchors.bottom: parent.bottom
        //anchors.left: parent.left
        //anchors.right: parent.right
     Tab{

         title:"Είδη"
      Rectangle{
          color:mainwindow.bgcolor
          anchors.fill: parent




    ListView{
        id: tradelines
        model: model1.getTradelines(invoiceedit.ftrid)
        //width:parent.width
        //height:parent.height*13/15
        //anchors.top:customer.bottom
        anchors.fill: parent

        delegate: TradeLinesEditDelegate{
            id:dlg
            item:modelData.role1
            qty:modelData.role3
            price: modelData.role2
            linevalue: modelData.role6

        }




    }

     }
    }
     Tab{
         title:"Παρατηρήσεις"
      Rectangle{
          color:mainwindow.bgcolor
          anchors.fill: parent

      Rectangle{
          id:commentsb
          height: parent.height/2
          width:parent.width
          color:mainwindow.bgcolor
          anchors.top: parent.top
          anchors.left:parent.left
          anchors.right: parent.right
          anchors.topMargin: 10
          anchors.leftMargin: 10
          anchors.rightMargin: 10
          Text{
              id:comment
              text: invoiceedit.comments=comment
              color: mainwindow.fgcolor
              anchors.fill: parent
              font.pixelSize: 25
              wrapMode: TextEdit.WordWrap
          }

      }
      Text{
          id:shipaddressl
          anchors.top: commentsb.bottom
          anchors.topMargin: 5
          anchors.left: parent.left
          anchors.leftMargin: 5
          color:mainwindow.fgcolor
          text:"Διεύθυνση Παράδοσης:"
          font.pixelSize: parent.width/32

      }
      Rectangle{
          anchors.top: shipaddressl.bottom
          anchors.topMargin: 5
          anchors.left: parent.left
          anchors.leftMargin: 5
          anchors.right: parent.right
          anchors.rightMargin: 5
          width:parent.width
          height: parent.height/15

          color:mainwindow.fgcolor
          Text{
              id:shipaddress
              text:invoiceedit.shipaddress
              anchors.fill: parent
              font.pixelSize: 25

          }

      }


      }
     }

     SqlQueryModel {
         id: model1

     Component.onCompleted: {
       model1.opendb();

     }
     }
}

    Rectangle{
        id: totals
        width: parent.width;
        height: parent.height/15
        color: mainwindow.captionbgcolor
        anchors.bottom: nv.top
        border.width: 1
        border.color: mainwindow.fgcolor
        RowLayout{
            spacing: 45
        Text{
            text:"Καθαρή Αξία:"
            height: totals.height
            width:totals.width/6
            color: mainwindow.captionfgcolor
            font.pixelSize: totals.width/32
        }

        Text{
            id:netvalue
            height: totals.height
            width:totals.width/6
            color: mainwindow.fgcolor
            font.pixelSize: totals.width/32
            anchors.right: totals.right
            text: model.getFintradeField(invoiceedit.ftrid,"netvalue")
            horizontalAlignment: Text.AlignRight
        }
        Text{
            text:"ΦΠΑ:"
            height: totals.height
            width:totals.width/6
            color: mainwindow.captionfgcolor
            font.pixelSize: totals.width/32
        }

        Text{
            id:vatamount
            height: totals.height
            width:totals.width/6
            color: mainwindow.fgcolor
            font.pixelSize: totals.width/32
            anchors.right: totals.right
            text: model.getFintradeField(invoiceedit.ftrid,"vatamount")
            horizontalAlignment: Text.AlignRight
        }
        Text{
            text:"Συνολική Αξία:"
            height: totals.height
            width:totals.width/6
            color: mainwindow.captionfgcolor
            font.pixelSize: totals.width/32
        }

        Text{
            id:totalvalue
            height: totals.height
            width:totals.width/6
            color: mainwindow.fgcolor
            font.pixelSize: totals.width/32
            anchors.right: totals.right
            text: model.getFintradeField(invoiceedit.ftrid,"totamount")
            horizontalAlignment: Text.AlignRight
        }
        }




    }

    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();
        onBarclicked:
        {
            if(m1.visible==false)
                m1.visible=true
            else
                m1.visible=false
            //m1.popup()
            console.log("ΠΑΤΗΘΗΚΑ")

        }


        FinTrade {
            id: fintrade
        }

    }

    Rectangle{
        id:m1
        width:parent.width
        height: nv.height*3
        anchors.bottom: nv.top
        visible: false
        color: mainwindow.bgcolor




        Rectangle{
            id:b2

            color:mainwindow.bgcolor

            anchors.left: parent.left
            height:parent.height
            width:parent.width/2
            border.color: mainwindow.fgcolor
            MouseArea{
                anchors.fill: parent
                onClicked: {
                        m1.visible=false
                        fintrade.setId(invoiceedit.ftrid)
                        fintrade.setCusid(model.getFintradeField(invoiceedit.ftrid,"cusid"))
                        fintrade.setDsrid(model.getFintradeField(invoiceedit.ftrid,"dsrid"))
                        fintrade.setDsrnumber(model.getFintradeField(invoiceedit.ftrid,"dsrnumber"))
                        var ftrdate=model.getFintradeField(invoiceedit.ftrid,"ftrdate")
                        var i=ftrdate.indexOf("@")
                        var fdate=ftrdate.substring(0,i)
                        var ftime=ftrdate.substring(i+1)
                        //console.log(fdate)
                        //console.log(ftime)
                        fintrade.setFtrdate(fdate)
                        fintrade.setFtrtime(ftime)
                        fintrade.setLines(model.getStoreTradelines(invoiceedit.ftrid))
                        console.log(model.getStoreTradelines(invoiceedit.ftrid))
                        fintrade.setNetvalue(model.getFintradeField(invoiceedit.ftrid,"netvalue"))
                        fintrade.setVatamount(model.getFintradeField(invoiceedit.ftrid,"vatamount"))
                        fintrade.setTotamount(model.getFintradeField(invoiceedit.ftrid,"totamount"))

                        fintrade.print(mainwindow.bt.socket)

                        }

                }

            Text{
                id:t2
                //anchors.top: parent.top

                //width:parent.width
                //height:parent.height/2
                text: "Εκτύπωση"
                font.bold: true
                font.pixelSize: 25
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:mainwindow.fgcolor

            }
            Image {
                id:image2
                anchors.bottom: parent.bottom
                anchors.top:t2.bottom
                anchors.right: parent.right

                //anchors.rightMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height:parent.height/2
                fillMode: Image.PreserveAspectFit
                source: "images/general/print.png"


            }


}


        Rectangle{
            id:b3

            color:mainwindow.bgcolor

            anchors.right: parent.right
            height:parent.height
            width:parent.width/2
            border.color: mainwindow.fgcolor
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    m1.visible=false
                    messageDialog.visible=true
                    //invoiceedit.deleteftr()

                    //stackView.pop(mainwindow)

                        }

                }
            MessageDialog {

                id: messageDialog
                //property bool error
                title: "Διαγραφή Παραστατικών"

                text: "Είστε σίγουρος πως θέλετε να διαγραφεί το παραστατικό;"
                visible: false
                standardButtons: StandardButton.Ok | StandardButton.Cancel
                onAccepted: {
                    invoiceedit.deleteftr()
                    messageDialog.close()
                    stackView.pop(mainwindow)
                }
                onRejected:
                {
                    messageDialog.close()
                }

                //Component.onCompleted: visible = true
            }

            Text{
                id:t3
                //anchors.top: parent.top

                //width:parent.width
                //height:parent.height/2
                text: "Διαγραφή"
                font.bold: true
                font.pixelSize: 25
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:mainwindow.fgcolor

            }
            Image {
                id:image3
                anchors.bottom: parent.bottom
                anchors.top:t3.bottom
                anchors.right: parent.right

                //anchors.rightMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height:parent.height/2
                fillMode: Image.PreserveAspectFit
                source: "images/general/delete-line.png"


            }


}

}

    SqlQueryModel {
        id: model


    }




    Component.onCompleted: {


      model.opendb();
      invoiceedit.comments=model.getFintradeField(invoiceedit.ftrid,"dsrid")
      invoiceedit.shipaddress=model.getFintradeField(invoiceedit.ftrid,"deliveryaddress")
      get_type()
        function get_type()
        {
            console.log(model.getFintradeField(invoiceedit.ftrid,"dsrid"))

            switch (model.getFintradeField(invoiceedit.ftrid,"dsrid"))
            {
                case 1:

                    btn1.checked=true;

                    break;
                case 2:

                    btn2.checked=true;
                    break;
                case 3:
                    btn3.checked=true;
                    break;
                case 4:
                    btn4.checked=true;
                    break;

                case 5:
                    btn5.checked=true;



             }
        }
    }



}
