import QtQuick 2.0
import SqlQueryModel 1.0


Rectangle {
    width: parent.width
    height: parent.height
    id: routelist
    color: mainwindow.bgcolor

    SqlQueryModel {
        id: model


    Component.onCompleted: {
      model.opendb();

    }
    }

    //anchors.fill: parent




    ListView {
        model: model.getRouteList()
        width:parent.width
        height:parent.height*19/20
        delegate: SimpleListDelegate{
            name: modelData.description
            color:mainwindow.fgcolor
            onClicked: selectroute()
            function selectroute(){
                mainwindow.selectedroute=modelData.erpid
                stackView.push(Qt.resolvedUrl("CustomerList.qml"));

            }
        }
    }



    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }


}