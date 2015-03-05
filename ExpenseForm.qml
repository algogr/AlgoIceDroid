import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.0
import SqlQueryModel 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    id:expenseform

    width: parent.width
    height: parent.height
    color: mainwindow.bgcolor
    property string expensetype
    property string cashtrnid
    property bool updatemode:false

    Rectangle{
        id: expensetypesel
        width: parent.width
        height: parent.height/10
        color: mainwindow.bgcolor
        anchors.top:parent.top
        anchors.topMargin: 150
        anchors.leftMargin: 50
        anchors.left: parent.left
        //border.width: 1
        //border.color: mainwindow.fgcolor


            RowLayout{
                id:test
                anchors.bottom: parent.bottom
                ExclusiveGroup { id: tabPositionGroup }
                        RadioButton {
                            id:btn1
                            style: RadioButtonStyle {


                                    indicator: Rectangle {
                                            //implicitWidth: 16
                                            //implicitHeight: 16
                                            anchors.top:parent.top

                                            width:16
                                            height: 16
                                            radius: 39
                                            border.color: control.activeFocus ? "black" : "grey"
                                            border.width: 1
                                            Rectangle {
                                                anchors.fill: parent
                                                visible: control.checked
                                                color: "black"
                                                radius: 9
                                                anchors.margins: 3
                                            }
                                    }
                                    label: Rectangle{
                                        color:"black"

                                        anchors.top:parent.top
                                        //implicitWidth: invoicetype.width/4
                                        //implicitHeight: 35
                                        width: expensetypesel.width/4
                                        //height: invoicetype.height
                                        height:16
                                        radius:39
                                        Text{
                                            text:"Βενζίνη"
                                            anchors.fill: parent
                                            color:"white"
                                            font.pixelSize: 14
                                            font.weight: Font.Bold
                                        }

                                    }
                            }

                            checked: true
                            exclusiveGroup: tabPositionGroup
                            onCheckedChanged: setexptype()
                            function setexptype()
                            {
                                if (checked==true)

                                    expenseform.expensetype="1"

                            }

                        }

                        RadioButton {
                            id:btn2
                            style: RadioButtonStyle {


                                    indicator: Rectangle {
                                            //implicitWidth: 16
                                            //implicitHeight: 16
                                            anchors.top:parent.top

                                            width:16
                                            height: 16
                                            radius: 39
                                            border.color: control.activeFocus ? "black" : "grey"
                                            border.width: 1
                                            Rectangle {
                                                anchors.fill: parent
                                                visible: control.checked
                                                color: "black"
                                                radius: 9
                                                anchors.margins: 3
                                            }
                                    }
                                    label: Rectangle{
                                        color:"black"

                                        anchors.top:parent.top
                                        //implicitWidth: invoicetype.width/4
                                        //implicitHeight: 35
                                        width: expensetypesel.width/3
                                        //height: invoicetype.height
                                        height:16
                                        radius:39
                                        Text{
                                            text:"Συντήρηση αυτοκινήτου"
                                            anchors.fill: parent
                                            color:"white"
                                            font.pixelSize: 14
                                            font.weight: Font.Bold
                                        }

                                    }
                            }

                            checked: false
                            exclusiveGroup: tabPositionGroup
                            onCheckedChanged: setexptype()
                            function setexptype()
                            {
                                if (checked==true)

                                    expenseform.expensetype="2"

                            }

                        }
                        RadioButton {
                            id:btn3
                            style: RadioButtonStyle {


                                    indicator: Rectangle {
                                            //implicitWidth: 16
                                            //implicitHeight: 16
                                            anchors.top:parent.top

                                            width:16
                                            height: 16
                                            radius: 39
                                            border.color: control.activeFocus ? "black" : "grey"
                                            border.width: 1
                                            Rectangle {
                                                anchors.fill: parent
                                                visible: control.checked
                                                color: "black"
                                                radius: 9
                                                anchors.margins: 3
                                            }
                                    }
                                    label: Rectangle{
                                        color:"black"

                                        anchors.top:parent.top
                                        //implicitWidth: invoicetype.width/4
                                        //implicitHeight: 35
                                        width: expensetypesel.width/3
                                        //height: invoicetype.height
                                        height:16
                                        radius:39
                                        Text{
                                            text:"Διάφορα έξοδα"
                                            anchors.fill: parent
                                            color:"white"
                                            font.pixelSize: 14
                                            font.weight: Font.Bold
                                        }

                                    }
                            }

                            checked: false
                            exclusiveGroup: tabPositionGroup
                            onCheckedChanged: setexptype()
                            function setexptype()
                            {
                                if (checked==true)

                                    expenseform.expensetype="3"

                            }

                        }


            }


                    }

    Text{

        //anchors.top: parent.top

        //width:parent.width
        //height:parent.height/2
        id:titlecomm
        anchors.top: expensetypesel.bottom
        anchors.topMargin: 50
        font.bold: true
        font.pixelSize: 35
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Αιτιολογία:"


    }
    Rectangle{
        id:valuecomm
        width: parent.width*2/3
        height:parent.height/20
        anchors.top: expensetypesel.bottom

        anchors.topMargin: 50
        anchors.left: titlecomm.right
        anchors.right: parent.right
        anchors.rightMargin: 1
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:value
            visible:true
            anchors.fill: parent
            cursorVisible: true

            //textFormat: TextEdit.PlainText
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            //horizontalAlignment: TextEdit.AlignLeft
            //validator: DoubleValidator{bottom: -5.0; top: 5.0; decimals: 1; notation: DoubleValidator.StandardNotation }


        }

}
    StringPropertyEdit{
        //width:parent.width
        id:cop
        anchors.top:titlecomm.bottom
        anchors.topMargin: 50
        visible: true
        height: parent.height/8
        title:"Ποσό:"
        //value: "0.00"
        alignment:TextInput.AlignRight
        onCancelclicked: stackView.pop()
        onOkclicked: ok()
        function ok()
        {
            if(expenseform.updatemode==false)
                model.insertExpense(cop.value,value.text,expensetype)
            else
            {
                model.updateCashtrnField(expenseform.cashtrnid,"justification",value.text)
                model.updateCashtrnField(expenseform.cashtrnid,"trncategory",expensetype)
                model.updateCashtrnField(expenseform.cashtrnid,"amount",cop.value)
            }
            stackView.pop()
        }
    }




    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }

    SqlQueryModel {
        id: model


    }
    Component.onCompleted:
    {
        if(expenseform.updatemode==true)
        {
        value.text=model.getCashtrnField(expenseform.cashtrnid,"justification")
        cop.value=model.getCashtrnField(expenseform.cashtrnid,"amount")
        switch(model.getCashtrnField(expenseform.cashtrnid,"trncategory"))
        {
        case 1:
            btn1.checked=true
            break;
        case 2:
            btn2.checked=true
            break;
        case 3:
            btn3.checked=true



        }
    }
    }
}
