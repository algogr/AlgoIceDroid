import QtQuick 2.2
import HttpComm 1.0
import SqlQueryModel 1.00
import QtQuick.Dialogs 1.1
Rectangle {
    width: parent.width
    height: parent.height
    color: mainwindow.bgcolor

    ListModel {
        id: pageModel


        ListElement {
            title: "Upload Ρυθμίσεων Tablet"
            page: "upload_ini"

        }

        ListElement {
            title: "Download Ρυθμίσεων Tablet"
            page: "download_ini"
            params:""
        }

        ListElement {
            title: "Edit Ρυθμίσεων Tablet"
            page: "Parameters.qml"
            params:""
        }

        ListElement {
            title: "Επαναφορά database"
            page: "restore"
            params:""
        }




                }

    ListView{
                    model: pageModel
                    anchors.fill: parent
                    delegate: SimpleListDelegate {
                        name: title
                        imgvisible: false
                        color: mainwindow.fgcolor
                        //color: index % 2 == 0 ? "green" : "red"
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

                            if (page=="restore")
                            {

                                httpcomm.restoredb()
                            }


                            if (page=="Parameters.qml")
                            {
                                stackView.push(Qt.resolvedUrl(page))
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
