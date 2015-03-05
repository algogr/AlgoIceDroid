import QtQuick 2.0
import SqlQueryModel 1.0
Rectangle {
    width: parent.width
    height: parent.height
    color: mainwindow.bgcolor
    StringPropertyEdit{
        //width:parent.width
        id:cop
        anchors.top:parent.top
        anchors.topMargin: parent.height/3
        visible: true
        title:"Άνοιγμα Ταμείου:"
        //value: "0.00"
        alignment:TextInput.AlignRight
        onCancelclicked: stackView.pop()

        onOkclicked: ok()
        function ok()
        {
            model.setCashOpening(cop.value)
            stackView.pop()
        }
    }

    SqlQueryModel{
        id:model
    }

    Component.onCompleted: {


            cop.value=parseFloat(model.getCashOpening(),10).toFixed(2);
        }

    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }

}
