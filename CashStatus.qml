import QtQuick 2.1
import SqlQueryModel 1.0

Rectangle {
    width: parent.width
    height: parent.height
    id: cashstatus
    color: mainwindow.bgcolor

    SqlQueryModel {
        id: model


    Component.onCompleted: {
      model.opendb();

    }
    }
    Rectangle
    {
        id:opening
        width:parent.width
        height:parent.width/20
        color: mainwindow.bgcolor
        anchors.top:parent.top
        anchors.topMargin: 25

    Rectangle {
        anchors.fill: parent
        color: mainwindow.bgcolor
        visible: mouse.pressed
        anchors.top: parent.top
    }


    Text {
        id: textitem
        color: mainwindow.cashopeningcolor
        font.pixelSize: parent.width/32
        width:parent.width/2
        text: "'Ανοιγμα Ταμείου"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.top: parent.top
        //anchors.right: textitem1.left
        anchors.leftMargin: 30
    }

    Text {
        id: textitem1
        color: mainwindow.cashopeningcolor
        font.pixelSize: parent.width/32
        text: parseFloat(model.getCashOpening(),10).toFixed(2);
        horizontalAlignment: Text.AlignRight
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: textitem.right
        anchors.right: img.left
        anchors.leftMargin: 10
        anchors.rightMargin: 30
    }

    Image {
        id:img
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        source: "images/general/navigation_next_item.png"

    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: root.clicked()


    }
}

    Rectangle
    {
        id:income
        width:parent.width
        height:parent.width/20
        color: mainwindow.bgcolor
        anchors.top:opening.bottom

    Rectangle {
        anchors.fill: parent
        color: mainwindow.bgcolor
        visible: mouse.pressed
        anchors.top: parent.top
    }

    Text {
        id: textitem10
        color: mainwindow.cashincomecolor
        font.pixelSize: parent.width/32
        width:parent.width/2
        text: "'Εσοδα:"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.top: parent.top
        //anchors.right: textitem1.left
        anchors.leftMargin: 30
    }

    Text {
        id: textitem11
        color: mainwindow.cashincomecolor
        font.pixelSize: parent.width/32
        text: parseFloat(model.getSumIncome(),10).toFixed(2);
        horizontalAlignment: Text.AlignRight
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: textitem10.right
        anchors.right: img1.left
        anchors.leftMargin: 10
        anchors.rightMargin: 30
    }


    Image {
        id:img1
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        source: "images/general/navigation_next_item.png"

    }

    MouseArea {
        id: mouse1
        anchors.fill: parent
        onClicked: stackView.push(Qt.resolvedUrl("IncomeList.qml"))


    }
}

    Rectangle
    {
        id:expenses
        width:parent.width
        height:parent.width/20
        color: mainwindow.bgcolor
        anchors.top:income.bottom

    Rectangle {
        anchors.fill: parent
        color: mainwindow.bgcolor
        visible: mouse.pressed
        anchors.top: parent.top
    }

    Text {
        id: textitem20
        color: mainwindow.cashexpensescolor
        font.pixelSize: parent.width/32
        width:parent.width/2
        text: "'Εξοδα:"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.top: parent.top
        //anchors.right: textitem1.left
        anchors.leftMargin: 30
    }

    Text {
        id: textitem21
        color: mainwindow.cashexpensescolor
        font.pixelSize: parent.width/32
        text: parseFloat(model.getSumExpenses(),10).toFixed(2);
        horizontalAlignment: Text.AlignRight
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: textitem20.right
        anchors.right: img2.left
        anchors.leftMargin: 10
        anchors.rightMargin: 30
    }


    Image {
        id:img2
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        source: "images/general/navigation_next_item.png"

    }

    MouseArea {
        id: mouse2
        anchors.fill: parent
        onClicked: stackView.push(Qt.resolvedUrl("ExpensesList.qml"))


    }
}
    Rectangle
    {
        id:balance
        width:parent.width
        height:parent.width/20
        color: mainwindow.bgcolor
        anchors.top:expenses.bottom

    Rectangle {
        anchors.fill: parent
        color: mainwindow.bgcolor
        visible: mouse.pressed
        anchors.top: parent.top
    }

    Text {
        id: textitem30
        color: mainwindow.fgcolor
        font.pixelSize: parent.width/32
        width:parent.width/2
        text: "Υπόλοιπο:"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.top: parent.top
        //anchors.right: textitem1.left
        anchors.leftMargin: 30
    }

    Text {
        id: textitem31
        color: mainwindow.fgcolor
        font.pixelSize: parent.width/32
        //text:parseFloat(test(),10).toFixed(2)
        text: test()
        function test()
        {
            var test= parseFloat(model.getCashOpening(),10)
            console.log(test*1)
            var test1=parseFloat(model.getSumIncome(),10)
            console.log(test1*1)
            var test2=parseFloat(model.getSumExpenses(),10);
            console.log(test2*1)
            var test4= parseFloat(test+test1-test2,10).toFixed(2)
            console.log(test4*1)
            return test4;
        }

        //var test= model.getSumIncome()-model.getSumExpenses();
        //text: parseFloat(model.getSumIncome()-model.getSumExpenses(),10).toFixed(2);
        //text: parseFloat(test,10).toFixed(2)
        horizontalAlignment: Text.AlignRight
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: textitem30.right
        anchors.right: img3.left
        anchors.leftMargin: 10
        anchors.rightMargin: 30
    }



    Image {
        id:img3
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: parent.top
        visible:false
        anchors.verticalCenter: parent.verticalCenter
        source: "images/general/navigation_next_item.png"

    }

}
    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }




}

