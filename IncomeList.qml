import QtQuick 2.0
import SqlQueryModel 1.0

Rectangle {
    width: parent.width
    height: parent.height
    id: incomelist
    color: mainwindow.bgcolor



    SqlQueryModel {
        id: model



    }

    //anchors.fill: parent




    ListView {
        id:lv
        model: model.getIncomeList()
        width:parent.width
        height:parent.height*19/20
        delegate: ThreeColListDelegate{
            name: modelData.role1
            color:mainwindow.fgcolor
            attr1: modelData.role2
            color1:mainwindow.columnlistcolor
            halign1: Text.AlignRight
            attr2: modelData.role3
            color2:mainwindow.captionfgcolor
            halign2: Text.AlignRight
            onClicked: selectitem()
            function selectitem(){
                if(modelData.role2!="Απόδειξη")
                    stackView.push(Qt.resolvedUrl("InvoiceEdit.qml"),{ftrid:modelData.role4});
                else

                    stackView.push(Qt.resolvedUrl("ReceiptEdit.qml"),{ftrid:modelData.role4,customer:modelData.role1})

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
