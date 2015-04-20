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
                source:"images/general/ini_arrow_up.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    httpcomm.upload_ini();
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
                text:"Upload ρυθμίσεων tablet"
                color:mainwindow.fgcolor
                font.pixelSize: 20
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
                source:"images/general/ini_arrow_down.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    httpcomm.download_ini();
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
                text:"Download ρυθμίσεων tablet"
                color:mainwindow.fgcolor
                font.pixelSize: 20
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
                source:"images/general/ini_edit.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackView.push(Qt.resolvedUrl("Parameters.qml"))
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
                text:"Edit Ρυθμίσεων Tablet"
                color:mainwindow.fgcolor
                font.pixelSize: 20
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
                source:"images/general/restore_database.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    dlgrestore.visible=true;
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
                text:"Επαναφορά βάσης δεδομένων"
                color:mainwindow.fgcolor
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter

            }

        }



    }


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


                    MessageDialog {
                        id: dlgrestore
                        title: "Επαναφορά βάσης;"
                        icon: StandardIcon.Question
                        text: "Θέλετε να επαναφέρετε τη βάση δεδομένων;"
                        detailedText: "Αυτή η διαδικασία μπορεί να επιφέρει απώλεια δεδομένων."
                        standardButtons: StandardButton.Yes | StandardButton.No
                        visible:false
                        onYes: httpcomm.restoredb();
                        onNo: dlgrestore.close();

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
