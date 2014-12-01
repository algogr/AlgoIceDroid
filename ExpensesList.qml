import QtQuick 2.0
import SqlQueryModel 1.0

Rectangle {
    width: parent.width
    height: parent.height
    id: expenseselist
    color: mainwindow.bgcolor



    SqlQueryModel {
        id: model



    }

    //anchors.fill: parent




    ListView {
        id:lv
        model: model.getExpensesList()
        width:parent.width
        height:parent.height*19/20
        delegate: ThreeColListDelegate{
            name: modelData.role2
            color:mainwindow.fgcolor
            /*
            attr1: modelData.role2
            color1:mainwindow.columnlistcolor
            halign1: Text.AlignRight
            */
            attr2: modelData.role3
            color2:mainwindow.captionfgcolor
            halign2: Text.AlignRight
            onClicked: selectitem()
            function selectitem(){
                stackView.push(Qt.resolvedUrl("ExpenseForm.qml"),{cashtrnid:modelData.role4,updatemode:true});

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
