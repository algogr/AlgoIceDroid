import QtQuick 2.0

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
        color: "black"

        Rectangle{

            id:b1
            color:"black"
            anchors.left: parent.left
            height:parent.height
            width:parent.width/2
            border.color: "white"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    editbox.visible=true
                    editbox.visible=true
                    editbox.title="Ποσό"
                    editbox.alignment=TextInput.AlignRight
                    //editbox.inputformat=DoubleValidator{bottom: 0.00; top: 9999.99; decimals: 2; notation: DoubleValidator.StandardNotation }
                    //editbox.iformat=IntValidator {bottom:0;top:2000}
                    //editbox.value="0.00"
                    //customerlist.updatefield:modelData.fieldname
                   //stackView.push(Qt.resolvedUrl("CustomerList.qml"),{checkin: 1})
                }
            }
            Text{
                id:t1
                //anchors.top: parent.top

                //width:parent.width
                //height:parent.height/2
                text: "Είσπραξη"
                font.bold: true
                font.pixelSize: 25
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:"white"

            }
            Image {
                id:image1
                anchors.bottom: parent.bottom
                anchors.top:t1.bottom
                anchors.right: parent.right

                //anchors.rightMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height:parent.height/2
                fillMode: Image.PreserveAspectFit
                source: "images/general/coins.png"


            }
        }



        Rectangle{
            id:b2

            color:"black"

            anchors.right: parent.right
            height:parent.height
            width:parent.width/2
            border.color: "white"
            MouseArea{
                anchors.fill: parent
                onClicked: {


                        }

                }

            Text{
                id:t2
                //anchors.top: parent.top

                //width:parent.width
                //height:parent.height/2
                text: "Τιμολόγηση"
                font.bold: true
                font.pixelSize: 25
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:"white"

            }
            Image {
                id:image2
                anchors.bottom: parent.bottom
                anchors.top:t2.bottom
                anchors.right: parent.right

                //anchors.rightMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height:parent.height/2
                fillMode: Image.PreserveAspectFit
                source: "images/general/invoice.png"


            }


}


}
}
