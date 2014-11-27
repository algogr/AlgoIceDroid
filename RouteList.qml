import QtQuick 2.0
import SqlQueryModel 1.0


Rectangle {
    width: parent.width
    height: parent.height
    id: districtlist
    color: mainwindow.bgcolor

    SqlQueryModel {
        id: model


    Component.onCompleted: {
      model.opendb();

    }
    }

    //anchors.fill: parent




    ListView {
        model: model.getDistrictList()
        width:parent.width
        height:parent.height*19/20
        delegate: SimpleListDelegate{
            name: modelData.description
            color:mainwindow.fgcolor
            onClicked: selectdistrict()
            function selectdistrict(){
                mainwindow.selecteddistrict=modelData.id
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
