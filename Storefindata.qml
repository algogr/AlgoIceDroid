import QtQuick 2.0
import SqlQueryModel 1.0

Rectangle {
    width: parent.width
    height: parent.height
    id: storefindata
    color: mainwindow.bgcolor


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
            color1:mainwindow.columnlistcolor
            halign1: Text.AlignRight
            attr2: modelData.remainingqty
            color2:mainwindow.captionfgcolor
            halign2: Text.AlignRight
            onClicked: selectitem()
            function selectitem(){
                mainwindow.selecteditem=modelData.id
                stackView.push(Qt.resolvedUrl("ItemTrans.qml"));

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
