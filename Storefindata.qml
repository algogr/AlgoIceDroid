import QtQuick 2.0
import SqlQueryModel 1.0

Rectangle {
    width: parent.width
    height: parent.height
    id: storefindata
    color: mainwindow.bgcolor
    property string selecteditem

    SqlQueryModel {
        id: model



    }

    //anchors.fill: parent




    ListView {
        model: model.getItemList()
        width:parent.width
        height:parent.height*19/20
        delegate: ThreeColListDelegate{
            name: modelData.description
            color:mainwindow.fgcolor
            attr1: modelData.startqty
            color1:mainwindow.fgcolor
            attr2: modelData.remainingqty
            color2:mainwindow.fgcolor
            onClicked: selectitem()
            function selectitem(){
                storefindata.selecteditem=modelData.id
                //stackView.push(Qt.resolvedUrl("Customer.qml"));

            }
        }
    }



    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }

    Component.onCompleted: {
      model.opendb();

    }
}
