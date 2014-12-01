import QtQuick 2.1
import SqlQueryModel 1.0
import QtQuick.Controls 1.0
import Customer 1.0


Rectangle{
    width: parent.width
    height: parent.height
    id: root

    color: mainwindow.bgcolor


TabView{
    width:parent.width
    height:parent.height
    id: tabv1
    clip: true
    tabPosition: Qt.TopEdge
    anchors.top:parent.top

    Tab{

          id:tb1
          title:"Σταθερά στοιχεία"

          property Item namefield: item.namefield
          property Item titlefield: item.titlefield
          property Item addressfield: item.addressfield
          //property Item titlefield: item.titlefield    district
          //property Item cityfield: item.cityfield
          property Item afmfield: item.afmfield
          //property Item douyfield: item.doyfield   doy
          property Item tel1field: item.tel1field
          property Item tel2field: item.tel2field
          property Item faxfield: item.faxfield
          property Item emailfield: item.emailfield
          Rectangle{
              id:f1f
          anchors.fill: parent
          color:mainwindow.bgcolor
          property Item namefield: name
          property Item titlefield: title
          property Item addressfield: address
          //property Item titlefield: title    district
          //property Item cityfield: city
          property Item afmfield: afm
          //property Item douyfield: doy   doy
          property Item tel1field: tel1
          property Item tel2field: tel2
          property Item faxfield: fax
          property Item emailfield: email



    Rectangle{
        id: f1

        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: parent.top
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{

                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "Επωνυμία:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height
            id:namer
            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor
            TextEdit{
                id:name
                //color:mainwindow.fgcolor
                font.pixelSize: root.height/25
                anchors.fill: parent
                //text: "Επωνυμία"
            }
        }
    }

    Rectangle{
        id:f2
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f1.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "Τίτλος:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor
            TextEdit{
                id:title
                //color:mainwindow.fgcolor
                font.pixelSize: root.height/25
                anchors.fill: parent
                //text: "Επωνυμία"
            }
        }
    }

    Rectangle{
        id:f3
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f2.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "Διεύθυνση:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor
            TextEdit{
                id:address
                //color:mainwindow.fgcolor
                font.pixelSize: root.height/25
                anchors.fill: parent
                //text: "Επωνυμία"
            }
        }
    }

    Rectangle{
        id:f4
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f3.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "Περιοχή:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor
            TextEdit{
                //color:mainwindow.fgcolor
                font.pixelSize: root.height/25
                anchors.fill: parent
                //text: "Επωνυμία"
            }
        }
    }

    Rectangle{
        id:f5
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f4.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "Πόλη:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor
            TextEdit{
                //color:mainwindow.fgcolor
                id:city
                font.pixelSize: root.height/25
                anchors.fill: parent
                //text: "Επωνυμία"
            }
        }
    }

    Rectangle{
        id:f6
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f5.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "ΑΦΜ:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor
            TextEdit{
                //color:mainwindow.fgcolor
                id:afm
                font.pixelSize: root.height/25
                anchors.fill: parent
                //text: "Επωνυμία"
            }
        }
    }

    Rectangle{
        id:f7
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f6.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "ΔΟΥ:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor

            ComboBox{
                //color:mainwindow.fgcolor
                //font.pixelSize: root.height/25
                //editable:true
                anchors.fill: parent
                model: model1.getRouteList()
                textRole: "description"
                //text: "Επωνυμία"
            }
            SqlQueryModel{
                id:model1
            }
        }
    }

    Rectangle{
        id:f8
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f7.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "Τηλ.1:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor
            TextEdit{
                id:tel1
                //color:mainwindow.fgcolor
                font.pixelSize: root.height/25
                anchors.fill: parent
                //text: "Επωνυμία"
            }
        }
    }


    Rectangle{
        id:f9
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f8.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "Τηλ.2:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor
            TextEdit{
                id:tel2
                //color:mainwindow.fgcolor
                font.pixelSize: root.height/25
                anchors.fill: parent
                //text: "Επωνυμία"
            }
        }
    }

    Rectangle{
        id:f10
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f9.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "Fax:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor
            TextEdit{
                //color:mainwindow.fgcolor
                id:fax
                font.pixelSize: root.height/25
                anchors.fill: parent
                //text: "Επωνυμία"
            }
        }
    }

    Rectangle{
        id:f11
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f10.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "Email:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor
            TextEdit{
                //color:mainwindow.fgcolor
                id:email
                font.pixelSize: root.height/25
                anchors.fill: parent

                //text: "Επωνυμία"
            }
        }
    }

    Rectangle{
        id:f12
        width:parent.width
        height: parent.height/20
        color: mainwindow.bgcolor
        anchors.top: f11.bottom
        anchors.topMargin: 25
        Rectangle{

            width:parent.width/2
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 25
            color: mainwindow.bgcolor
            Text{
                color:mainwindow.fgcolor
                font.pixelSize: root.height/20
                text: "Καθεστώς ΦΠΑ:"
                anchors.fill: parent
            }
        }

        Rectangle{

            width:parent.width/2
            height: parent.height

            color: mainwindow.fgcolor
            anchors.right: parent.right
            anchors.rightMargin: 25
            border.color: mainwindow.bgcolor

            ComboBox{
                //color:mainwindow.fgcolor
                //font.pixelSize: root.height/25
                //editable:true
                anchors.fill: parent
                model: model1.getVatStatusList()
                textRole: "description"
                //text: "Επωνυμία"
            }
            SqlQueryModel{
                id:model2
            }
        }
    }

}

          }
    Tab{
          title:"Παρατηρήσεις"


          Rectangle{
          anchors.fill: parent
          color:mainwindow.bgcolor

          Rectangle{
              anchors.fill: parent
              anchors.margins: 25
              color:mainwindow.fgcolor
              TextEdit{
                  id:comments
                  font.pixelSize: root.height/25
                  anchors.fill: parent
              }
          }

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
           onClicked: clicked1()
           function clicked1(){
                   //console.log(tb1.titlefield.text)
                   customerobject.setName(tb1.namefield.text)
                   customerobject.setTitle(tb1.titlefield.text)
                   customerobject.setAddress(tb1.addressfield.text)
                   customerobject.setAfm(tb1.afmfield.text)
                   customerobject.setTel1(tb1.tel1field.text)
                   customerobject.setTel2(tb1.tel2field.text)
                   customerobject.setFax(tb1.faxfield.text)
                   customerobject.setEmail(tb1.emailfield.text)
                   //customerobject.setName(tabv1.namea)
                   //console.log(customerobject.name())
                   //invoice.insert()
                   customerobject.insert()
                   m1.visible=false
                   b1.visible=false
                   b1.enabled=false
                }
            }
            Text{
                id:t1
                //anchors.top: parent.top

                //width:parent.width
                //height:parent.height/2
                text: "Καταχώρηση"
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
                height:parent.height/2
                fillMode: Image.PreserveAspectFit
                source: "images/general/checkin.png"


            }
        }




        Rectangle{
            id:b3

            color:mainwindow.bgcolor

            anchors.right: parent.right
            height:parent.height
            width:parent.width/2
            border.color: mainwindow.fgcolor
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    m1.visible=false
                    //invoice.deleteftr()
                    //stackView.pop()

                        }

                }

            Text{
                id:t3
                //anchors.top: parent.top

                //width:parent.width
                //height:parent.height/2
                text: "Ακύρωση"
                font.bold: true
                font.pixelSize: 25
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:mainwindow.fgcolor

            }
            Image {
                id:image3
                anchors.bottom: parent.bottom
                anchors.top:t3.bottom
                anchors.right: parent.right

                //anchors.rightMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height:parent.height/2
                fillMode: Image.PreserveAspectFit
                source: "images/general/delete-line.png"


            }


}


}

    SqlQueryModel{
        id:model
    }

    Customer{
        id:customerobject
    }



}



