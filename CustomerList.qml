import QtQuick 2.1
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
        model: model.getCustomerListbyDistrict(mainwindow.selecteddistrict)
        width:parent.width
        height:parent.height*19/20
        delegate: TwoColListDelegate{
            name: modelData.name
            color:mainwindow.fgcolor
            attr1: modelData.title
            color1:mainwindow.fgcolor
            onClicked: selectcustomer()
            function selectcustomer(){
                mainwindow.selectedcustomer=modelData.id
                stackView.push(Qt.resolvedUrl("Customer.qml"));

            }
        }
    }



    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }


}
