import QtQuick 2.1
import SqlQueryModel 1.0
import Customer 1.0


Rectangle {
    width: parent.width
    height: parent.height
    id: customerlist
    color: mainwindow.bgcolor
    onActiveFocusChanged:
     {
        console.log("JIM FOCUS CHANGED")
        test.model=model.getCustomerListbyRoute(mainwindow.selectedroute)
    }

    SqlQueryModel {
        id: model


    Component.onCompleted: {
      model.opendb();

    }

    }




    //anchors.fill: parent




    ListView {
        id:list
        model: model.getCustomerListbyRoute(mainwindow.selectedroute)
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
                console.log("ID:"+modelData.id);
                stackView.push(Qt.resolvedUrl("Customer.qml"));

            }
        }
    }

    Rectangle{
        id:search
        visible:false
        focus: true
        border.color: mainwindow.bgcolor
        border.width: 10
        anchors.left: parent.left
        height:parent.height*2/15
        width: parent.width
        anchors.bottom: nv.top
        color:mainwindow.fgcolor
        TextInput
        {
            id:value
            focus:true
            visible:true
            anchors.fill: parent
            inputMethodHints: Qt.ImhUppercaseOnly

            //anchors.leftMargin: 15
            //anchors.rightMargin: 15
            anchors.margins: 15
            cursorVisible: true
            //textFormat: TextEdit.PlainText
            cursorPosition: 55

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 35
            onTextChanged: {
                list.model=model.getCustomerListbyRoute(mainwindow.selectedroute,value.text)
                list.update()
            }

            //horizontalAlignment: TextEdit.AlignLeft
            //validator: DoubleValidator{bottom: -5.0; top: 5.0; decimals: 1; notation: DoubleValidator.StandardNotation }


        }


    }



    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();
        onBarclicked:
        {
            if(search.visible==true)
            {

                search.visible=false
                return;
            }

            if(m1.visible==false)
                m1.visible=true
            else
                m1.visible=false


            //m1.popup()
            console.log("ΠΑΤΗΘΗΚΑ")

        }

        Rectangle{
            id:m1
            width:parent.width
            height: nv.height*3
            anchors.bottom: nv.top
            visible: false
            color: mainwindow.bgcolor

            Rectangle{

                id:b1
                color:mainwindow.bgcolor
                anchors.left: parent.left
                height:parent.height
                width:parent.width/2
                border.color: mainwindow.fgcolor
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        m1.visible=false

                        stackView.push(Qt.resolvedUrl("CustomerNew.qml"))
                    }
                }
                Text{
                    id:t1
                    //anchors.top: parent.top

                    //width:parent.width
                    //height:parent.height/2
                    text: "Νέος Πελάτης"
                    font.bold: true
                    font.pixelSize: 25
                    //anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color:mainwindow.fgcolor

                }
                Image {
                    id:image1
                    anchors.bottom: parent.bottom
                    anchors.top:t1.bottom
                    anchors.right: parent.right

                    //anchors.rightMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    height:parent.height
                    fillMode: Image.PreserveAspectFit
                    source: "images/general/android-add-image.png"


                }
            }

            //
            Rectangle{

                id:b2
                color:mainwindow.bgcolor
                anchors.left: b1.right
                height:parent.height
                width:parent.width/2
                border.color: mainwindow.fgcolor
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        search.visible=true
                        search.focus=true
                        m1.visible=false


                    }
                }
                Text{
                    id:t2
                    //anchors.top: parent.top

                    //width:parent.width
                    //height:parent.height/2
                    text: "Αναζήτηση"
                    font.bold: true
                    font.pixelSize: 25
                    //anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color:mainwindow.fgcolor

                }
                Image {
                    id:image2
                    anchors.bottom: parent.bottom
                    anchors.top:t2.bottom
                    anchors.right: parent.right

                    //anchors.rightMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    height:parent.height
                    fillMode: Image.PreserveAspectFit
                    source: "images/general/android-search.png"


                }
            }

            //



    }
    }


}
