import QtQuick 2.1
import SqlQueryModel 1.0
import Customer 1.0
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.0



Rectangle {
    width: parent.width
    height: parent.height
    id: customernew
    color: mainwindow.bgcolor

    property string updatefield
    property alias amodel:listview.model
    property string selecteddoy
    property string selectedvatstatus
    property string name
    property string title
    property string address
    property string district
    property string city
    property string afm
    property string occupation
    property string tel1
    property string tel2
    property string fax
    property string email
    property string comments

    signal doychanged(string doytext)
    signal vatstatuschanged(string vatstatustext)
    //signal insert_customer()

    ListView {
        id:listview
        model: model.CustomerData()
        width:parent.width
        height:parent.height*19/20
        delegate: EntityInsertDelegate{
            id:dlg
            dlgheight: setheight()
            function setheight()
            {
                if (modelData.longtext==true)
                {
                    return 250
                }

                else
                    return 58

            }

            name: modelData.title
            color:mainwindow.fgcolor
            //attr1: modelData.value
            color1: mainwindow.fgcolor
            /*
            teditvisible: textvisible()
            function textvisible()
            {
                if (modelData.relatedentity=="")
                    return true
                else
                    return false

            }
            */
            combovisible: comboboxvisible()
            //combomodel:  model.getDoyList()
            function comboboxvisible()
            {
                if (modelData.relatedentity=="")
                    return false
                else
                {
                    if (modelData.relatedentity=="Doy")
                    {
                    combomodel=model1.getDoyList()
                    combofield="description"

                    }

                    if (modelData.relatedentity=="VatStatus")
                    {

                    combomodel=model1.getVatStatusList()
                    combofield="description"
                    }
                    return true
                }


            }
            SqlQueryModel {
                id: model1


                }

    }



}
//}
//}
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

                        m1.visible=false
                        customernew.insert_customer()
                        stackView.pop()
1                    }
                }
                Text{
                    id:t1
                    //anchors.top: parent.top

                    //width:parent.width
                    //height:parent.height/2
                    text: "Καταχώρηση"
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
                    source: "images/general/checkin.png"


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
                        m1.visible=false
                        stackView.pop()

                            }

                    }

                Text{
                    id:t2
                    //anchors.top: parent.top

                    //width:parent.width
                    //height:parent.height/2
                    text: "Ακύρωση"
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
                    source: "images/general/delete-line.png"


                }


    }


    }

    }







    SqlQueryModel {
        id: model


        }

    Customer{
        id:customerobject
    }

    Component.onCompleted: {
        customernew.doychanged.connect(doy)
        customernew.vatstatuschanged.connect(vatstatus)
        var doylist=model.getDoyList()
        var vatstatuslist=model.getVatStatusList()
        customernew.selectdoy=doylist[0].description
        customernew.selectedvatstatus =vatstatuslist[0].descrption

    }

    function doy(doytext)
    {
        customernew.selecteddoy=doytext

    }
    function vatstatus(vatstatustext)
    {
        customernew.selectedvatstatus=vatstatustext

    }

    function insert_customer()
    {
        var doyid=model.getDoybyDescription(selecteddoy)
        var vatstatusid=model.getVatStatusbyDescription(selectedvatstatus)
        customerobject.setName(customernew.name)
        customerobject.setTitle(customernew.title)
        customerobject.setAddress(customernew.address)
        customerobject.setDistrict(customernew.district)
        customerobject.setCity(customernew.city)
        customerobject.setAfm(customernew.afm)
        customerobject.setOccupation(customernew.occupation)
        customerobject.setTel1(customernew.tel1)
        customerobject.setTel2(customernew.tel2)
        customerobject.setFax(customernew.fax)
        customerobject.setEmail(customernew.email)
        customerobject.setComments(customernew.comments)
        customerobject.setDoyid(doyid)
        customerobject.setVatstatusid(vatstatusid)
        customerobject.setRouteid(mainwindow.selectedroute)
        customerobject.insert()

    }

}
