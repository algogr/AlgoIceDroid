import QtQuick 2.0
import SqlQueryModel 1.0


Rectangle {
    width: parent.width
    height: parent.height
    id: routelist
    color: mainwindow.bgcolor
    property string selected



    //anchors.fill: parent




    ListView {
        model: model.getDoyList()
        width:parent.width
        height:parent.height*19/20
        delegate: SimpleListDelegate{
            name: modelData.description
            color:mainwindow.fgcolor
            imgvisible: false
            onClicked: selectdoy()
            function selectdoy(){
                model1.updateCustomerField(selected,"doyid",modelData.erpid)
                stavkView.pop();
                //mainwindow.selectedroute=modelData.id
                //stackView.push(Qt.resolvedUrl("CustomerList.qml"));

            }
        }
        SqlQueryModel{
            id:model1
        }
    }



    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }

    SqlQueryModel {
        id: model


    Component.onCompleted: {
      model.opendb();

    }
    }


}
