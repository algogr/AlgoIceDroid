import QtQuick 2.1
import SqlQueryModel 1.0
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.0



Rectangle {
    width: parent.width
    height: parent.height
    id: customerlist
    color: mainwindow.bgcolor

    property string updatefield
    property alias amodel:listview.model




    //anchors.fill: parent




    ListView {
        id:listview
        model: model.CustomerData(mainwindow.selectedcustomer)
        width:parent.width
        height:parent.height*19/20
        delegate: EntityDelegate{
            id:dlg
            name: modelData.title
            color:mainwindow.fgcolor
            attr1: modelData.value
            color1:mainwindow.fgcolor
            image:imgsource()
            function imgsource()
            {
                //BUG: On edit a field looses anchors when the above has no image
                if (modelData.editable==true)
                {
                    dlg.image="images/general/android-edit-image.png"
                    dlg.imagebgcolor=mainwindow.buttonbgcolor
                }
                else
                {
                    //dlg.image=""
                    dlg.imgenabled=false
                    dlg.imagebgcolor=mainwindow.bgcolor
                }
            }

            onEditclicked: edclicked()

            function edclicked()
            {
                if(modelData.editable==true)
                {
                    if(modelData.relatedentity=="")
                    {
                        editbox.visible=true
                        editbox.title=modelData.title
                        editbox.alignment=TextEdit.AlignLeft
                        //editbox.stringformat=true
                        editbox.value=modelData.value
                        customerlist.updatefield=modelData.fieldname
                    }
                    else
                    {
                        var fieldname=modelData.relatedentity+"id"
                        var cusid=mainwindow.selectedcustomer
                        var selectedid=listview.getcusfield(cusid,fieldname)

                        console.log("FIELDNAME:"+fieldname+"-"+cusid+"-"+selectedid)
                        stackView.push(Qt.resolvedUrl(modelData.relatedentity+"ListR.qml"),{selected:selectedid})

                    }

            }
        }

    }
       function getcusfield(cusid,fieldname)
       {
           return model.getCustomerField(cusid,fieldname)
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

        Rectangle{
            id:m1
            width:parent.width
            height: nv.height*3
            anchors.bottom: nv.top
            visible: false
            color: mainwindow.bgcolor

            Rectangle{

                id:b1
                color:mainwindow.bgcolor
                anchors.left: parent.left
                height:parent.height
                width:parent.width/2
                border.color: mainwindow.fgcolor
                MouseArea{
                    anchors.fill: parent
                    onClicked: {


                        amountbox.visible=true
                        amountbox.title="Ποσό"
                        amountbox.alignment=TextInput.AlignRight
                        //editbox.inputformat=DoubleValidator{bottom: 0.00; top: 9999.99; decimals: 2; notation: DoubleValidator.StandardNotation }
                        //editbox.decimalformat=true
                        amountbox.value=""
                        //customerlist.updatefield:modelData.fieldname
                       //stackView.push(Qt.resolvedUrl("CustomerList.qml"),{checkin: 1})
                    }
                }
                Text{
                    id:t1
                    //anchors.top: parent.top

                    //width:parent.width
                    //height:parent.height/2
                    text: "Είσπραξη"
                    font.bold: true
                    font.pixelSize: 25
                    //anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color:mainwindow.fgcolor

                }
                Image {
                    id:image1
                    anchors.bottom: parent.bottom
                    anchors.top:t1.bottom
                    anchors.right: parent.right

                    //anchors.rightMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    height:parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "images/general/coins.png"


                }
            }



            Rectangle{
                id:b2

                color:mainwindow.bgcolor

                anchors.right: parent.right
                height:parent.height
                width:parent.width/2
                border.color: mainwindow.fgcolor
                MouseArea{
                    anchors.fill: parent
                    onClicked: {


                            }

                    }

                Text{
                    id:t2
                    //anchors.top: parent.top

                    //width:parent.width
                    //height:parent.height/2
                    text: "Τιμολόγηση"
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
                    source: "images/general/invoice.png"


                }


    }


    }
    }




    StringPropertyEdit{
        id: editbox
        visible:false
        title:""
        anchors.bottom: nv.top
        width:parent.width
        onOkclicked: customerlist.updatefieldfunc(customerlist.updatefield,editbox.value)

        onCancelclicked:visible=false

    }

    DoublePropertyEdit{
        id: amountbox
        visible:false


        anchors.bottom: nv.top
        width:parent.width
        onOkclicked: customerlist.updatebalancefunc(amountbox.value)

        onCancelclicked:visible=false


    }

    SqlQueryModel {
        id: model


    Component.onCompleted: {
      model.opendb();

    }
    }

    function updatefieldfunc(fieldname,value)
    {
        console.log(editbox.visible)
        editbox.visible=false
        model.updateCustomerField(mainwindow.selectedcustomer,fieldname,value)
        listview.model=model.CustomerData(mainwindow.selectedcustomer)
        console.log("PRIN")
        //listview.delegate.destroy()
        //listview.model=model.CustomerData(mainwindow.selectedcustomer)
        reloaddata()

        //listview.model
        //modelData.value="fksdjfs"
        //console.log("PAPA"+modelData.value)
    }

    function updatebalancefunc(value)
    {

        amountbox.visible=false
        model.updateCustomerBalance(mainwindow.selectedcustomer,value)
        listview.model=model.CustomerData(mainwindow.selectedcustomer)

        //listview.delegate.destroy()
        //listview.model=model.CustomerData(mainwindow.selectedcustomer)
        reloaddata()
        m1.visible=false
        //listview.model
        //modelData.value="fksdjfs"
        //console.log("PAPA"+modelData.value)
    }

    function reloaddata()
    {
        //BUG: listview does not refresh
        //TODO: Doy edit
        amodel=model.CustomerData(mainwindow.selectedcustomer)
    }

}
