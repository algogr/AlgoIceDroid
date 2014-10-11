import QtQuick 2.0
import SqlQueryModel 1.0
import QtQuick.Controls 1.1



Rectangle {
    width: parent.width
    height: parent.height
    id: districtlistr
    color: mainwindow.bgcolor
    property string selected

    SqlQueryModel {
        id: model


    Component.onCompleted: {
      model.opendb();

    }
    }

    Loader
      {
        id: myLoader
        source: "Customer.qml"
      }

      Connections
      {
        target: myLoader.item.updatefieldfunc()
      }


    //anchors.fill: parent




    ListView {
        model: model.getDistrictList()
        width:parent.width
        height:parent.height*19/20
        ExclusiveGroup { id: radiobuttonGroup }
        delegate: SimpleListRDelegate{
            name: modelData.description
            exclusivegroup: radiobuttonGroup
            checkeditem: selecteditem()
            function selecteditem()
            {

                if (selected==modelData.id)
                    return true
                else
                    return false
            }

            onClicked: selectdistrict()
            function selectdistrict(){
                myLoader.item.updatefieldfunc("districtid",modelData.id)
                stackView.pop();
                //stackView.pop(Qt.resolvedUrl("CustomerList.qml"));
            }
        }
    }



    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }


}
