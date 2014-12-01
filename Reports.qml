import QtQuick 2.0
import SqlQueryModel 1.0


Rectangle {
    width: parent.width
    height: parent.height
    color: mainwindow.bgcolor

    ListModel {
        id: pageModel


        ListElement {
            title: "Αποθήκη"
            page: "Storefindata.qml"

        }

        ListElement {
            title: "Παραστατικά"
            page: "InvoiceList.qml"
            params:""
        }
        ListElement {
            title: "Υπόλοιπα"
            page: "CustomerBalance.qml"
        }
                }

    ListView{
                    model: pageModel
                    anchors.fill: parent
                    delegate: SimpleListDelegate {
                        name: title
                        color: mainwindow.fgcolor
                        onClicked:
                        {

                            stackView.push(Qt.resolvedUrl(page))

                        }
                    }
                }
    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }

    SqlQueryModel{
        id:model
    }

}
