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
                stackView.push(Qt.resolvedUrl("Customer.qml"));

            }
        }
    }



    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();
        onBarclicked:
        {
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
                width:parent.width
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




    }
    }


}
