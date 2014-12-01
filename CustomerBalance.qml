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
        model: model.getCustomerBalance()
        width:parent.width
        height:parent.height*19/20
        delegate: TwoColListDelegate{
            name: modelData.role1
            color:mainwindow.fgcolor
            attr1: modelData.role2
            color1:mainwindow.fgcolor
            imagevisible: false
        }
    }



    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();
    }
}
