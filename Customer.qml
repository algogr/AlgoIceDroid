import QtQuick 2.0
import SqlQueryModel 1.0


Rectangle {
    width: parent.width
    height: parent.height
    id: customerlist
    color: mainwindow.bgcolor

    SqlQueryModel {
        id: model


    Component.onCompleted: {
      model.opendb();

    }
    }

    //anchors.fill: parent




    ListView {
        model: model.CustomerData(mainwindow.selectedcustomer)
        width:parent.width
        height:parent.height*19/20
        delegate: EntityDelegate{
            name: modelData.title
            color:mainwindow.fgcolor
            attr1: modelData.value
            color1:mainwindow.fgcolor
            onEditclicked: edclicked()
            function edclicked()
            {
                editbox.visible=true
                console.log("editclicjed")
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
        anchors.bottom: nv.top
        //width:parent.width

    }


}
