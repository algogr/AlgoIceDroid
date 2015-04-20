import QtQuick 2.2
import HttpComm 1.0
import SqlQueryModel 1.00
import QtQuick.Dialogs 1.1
Rectangle {
    width: parent.width
    height: parent.height
    color: mainwindow.bgcolor

    Grid{
        anchors.fill: parent
        spacing:2
        columns:parent.width/mainwindow.rectanglesize
        Rectangle
        {
            width: mainwindow.rectanglesize
            height:mainwindow.rectanglesize
            border.color: mainwindow.fgcolor
            color:mainwindow.bgcolor
            border.width: 2

            Image{
                width: parent.width
                height: parent.height*8/10
                anchors.top: parent.top
                source:"images/general/arrow_up.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    httpcomm.upload();
                }



            }
            Text
            {
                width:parent.width
                height: parent*2/10

                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.verticalCenter: parent.verticalCenter
                //anchors.baseline: parent.baseline
                text:"Upload βάσης δεδομένων"
                color:mainwindow.fgcolor
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter

            }

        }

        Rectangle
        {
            width: mainwindow.rectanglesize
            height:mainwindow.rectanglesize
            border.color: mainwindow.fgcolor
            color:mainwindow.bgcolor
            border.width: 2

            Image{
                width: parent.width
                height: parent.height*8/10
                anchors.top: parent.top
                source:"images/general/arrow_down.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    httpcomm.download();
                }



            }
            Text
            {
                width:parent.width
                height: parent*2/10

                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.verticalCenter: parent.verticalCenter
                //anchors.baseline: parent.baseline
                text:"Download βάσης δεδομένων"
                color:mainwindow.fgcolor
                font.pixelSize: 21
                horizontalAlignment: Text.AlignHCenter

            }

        }


    }

    /*

    ListModel {
        id: pageModel


        ListElement {
            title: "Upload Βάσης δεδομένων"
            color:"green"
            page: "upload"

        }

        ListElement {
            title: "Download βάσης δεδομένων"
            color:"red"
            page: "download"
            params:""
        }



                }

    ListView{
                    model: pageModel
                    anchors.fill: parent
                    delegate: SimpleListDelegate {
                        name: title
                        imgvisible: false
                        //color: mainwindow.fgcolor
                        color: index % 2 == 0 ? "green" : "red"
                        onClicked:
                        {
                            //model.closedb();
                            if (page=="upload")
                            {

                                httpcomm.upload()
                            }

                            if (page=="download")
                            {

                                httpcomm.download()
                            }

                            if (page=="upload_ini")
                            {

                                httpcomm.upload_ini()
                            }

                            if (page=="download_ini")
                            {

                                httpcomm.download_ini()
                            }

                            if (page=="Parameters.qml")
                            {
                                stackView.push(Qt.resolvedUrl(page))
                            }




                        }
                    }
                    */
                    MessageDialog {

                        id: messageDialog
                        //property bool error
                        title: "Επικοινωνία με τον server"

                        //text: "H εργασία ολοκληρώθηκε επιτυχώς!"
                        visible: false
                        onAccepted: {

                            messageDialog.close()
                        }
                        //Component.onCompleted: visible = true
                    }


    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }

    HttpComm
    {
        id:httpcomm

        onReply_finished:
        {
            console.log("REPLY FINISHED:")
            if(error==true)
            {
            messageDialog.text="Πρόβλημα επικοινωνίας με τον server!"
            }
            else
            {
                messageDialog.text="H εργασία ολοκληρώθηκε επιτυχώς!"

            }
            messageDialog.visible=true;

        }

    }
    SqlQueryModel{
        id:model
        Component.onCompleted: {
          model.closedb();

        }
    }


}
