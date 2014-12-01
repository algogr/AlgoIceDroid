import QtQuick 2.0

Rectangle {
    width: parent.width
    height: parent.height
    color: mainwindow.bgcolor

    ListModel {
        id: pageModel


        ListElement {
            title: "Άνοιγμα Ταμείου"
            page: "CashOpening.qml"
        }

        ListElement {
            title: "Έξοδα"
            page: "ExpenseForm.qml"
        }
        ListElement {
            title: "Κατάσταση Ταμείου"
            page: "CashStatus.qml"
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

}
