import QtQuick 2.0
import SqlQueryModel 1.0


Rectangle {
    width: parent.width
    height: parent.height
    id: customerlist
    color: mainwindow.bgcolor
    property string updatefield


    SqlQueryModel {
        id: model


    Component.onCompleted: {
      model.opendb();

    }
    }

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
                if (modelData.editable==true)
                    dlg.image="images/general/android-edit-image.png"
                else
                    dlg.image=""
            }

            onEditclicked: edclicked()
            function edclicked()
            {
                if(modelData.editable==true)
                {
                editbox.visible=true
                editbox.title=modelData.title
                editbox.value=modelData.value
                customerlist.updatefield=modelData.fieldname
                }

            }
        }
    }



    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }


    StringPropertyEdit{
        id: editbox
        visible:false
        title:""
        anchors.bottom: nv.top
        width:parent.width
        onOkclicked: accepted()
        function accepted()
        {
            editbox.visible=false
            model.updateCustomerField(mainwindow.selectedcustomer,customerlist.updatefield,editbox.value)
            //listview.delegate.destroy()
            listview.model=model.CustomerData(mainwindow.selectedcustomer)
            //listview.model
            //modelData.value="fksdjfs"
            //console.log("PAPA"+modelData.value)
        }

    }



}
