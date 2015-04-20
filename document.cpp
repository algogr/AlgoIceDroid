#include "document.h"
#include "sqlquerymodel.h"


Document::Document(QObject *parent,QBluetoothSocket *socket) :
    QObject(parent)
{
    qDebug()<<"PASSED SOCKET:"<<socket;
    this->socket=socket;
    qDebug()<<"DOCUMENT SOCKET:"<<this->socket;
    QStringList companydata=sqlquerymodel::getcompanydata();
    setcompanyname(companydata.at(0));
    setcompanyoccupation(companydata.at(1));
    setcompanyaddress(companydata.at(2));
    setcompanycity(companydata.at(3));
    setcompanyafm(companydata.at(4));
    setcompanydoy(companydata.at(5));
    setcompanytel1(companydata.at(6));
    setcompanytel2(companydata.at(7));
    setcompanyemail(companydata.at(8));


}

QString Document::companyname()
{
    return mcompanyname;
}

QString Document::companyoccupation()
{
    return mcompanyoccupation;
}

QString Document::companyafm()
{
    return mcompanyafm;
}

QString Document::companydoy()
{
    return mcompanydoy;
}

QString Document::companytel1()
{
    return mcompanytel1;
}

QString Document::companytel2()
{
    return mcompanytel2;
}

QString Document::companyaddress()
{
    return mcompanyaddress;
}

QString Document::companycity()
{
    return mcompanycity;
}

QString Document::companyemail()
{
    return mcompanyemail;
}

QString Document::companywebsite()
{
    return mcompanywebsite;
}

QString Document::documenttype()
{
    return mdocumenttype;
}

QString Document::documentnumber()
{
    return mdocumentnumber;
}

QString Document::documentdate()
{
    return mdocumentdate;
}

QString Document::documenttime()
{
    return mdocumenttime;
}

QString Document::documentseries()
{
    return mdocumentseries;
}

QString Document::customername()
{
    return mcustomername;
}

QString Document::customeroccupation()
{
    return mcustomeroccupation;
}

QString Document::customerafm()
{
    return mcustomerafm;
}

QString Document::customerdoy()
{
    return mcustomerdoy;
}

QString Document::customeraddress()
{
    return mcustomeraddress;
}

QString Document::customercity()
{
    return mcustomercity;
}

QString Document::deliveryaddress()
{
    return mdeliveryaddress;
}

QString Document::tvalue()
{
    //return QString::number(mtvalue.toFloat(), 'f', 2);
    return mtvalue;
}

QString Document::tvat()
{
    return mtvat;
}

QString Document::total()
{
    return mtotal;
}

void Document::setcompanyname(QString name)
{
    mcompanyname=name;
}

void Document::setcompanyoccupation(QString occupation)
{
    mcompanyoccupation=occupation;
}

void Document::setcompanyafm(QString afm)
{
    mcompanyafm=afm;
}

void Document::setcompanydoy(QString doy)
{
    mcompanydoy=doy;
}

void Document::setcompanytel1(QString tel1)
{
    mcompanytel1=tel1;
}

void Document::setcompanytel2(QString tel2)
{
    mcompanytel2=tel2;
}

void Document::setcompanyaddress(QString address)
{
    mcompanyaddress=address;
}

void Document::setcompanycity(QString city)
{
    mcompanycity=city;
}

void Document::setcompanyemail(QString email)
{
    mcompanyemail=email;
}

void Document::setcompanywebsite(QString website)
{
    mcompanywebsite=website;
}

void Document::setdocumenttype(QString documenttype)
{
    mdocumenttype=documenttype;
}

void Document::setdocumentnumber(QString documentnumber)
{
    mdocumentnumber=documentnumber;
}

void Document::setdocumentdate(QString documentdate)
{
    mdocumentdate=documentdate;
}

void Document::setdocumenttime(QString documenttime)
{
    mdocumenttime=documenttime;
}

void Document::setdocumentseries(QString documentseries)
{
    mdocumentseries=documentseries;
}

void Document::setcustomername(QString name)
{
    mcustomername=name;
}

void Document::setcustomeroccupation(QString occupation)
{
    mcustomeroccupation=occupation;
}

void Document::setcustomerafm(QString afm)
{
    mcustomerafm=afm;
}

void Document::setcustomerdoy(QString doy)
{
    mcustomerdoy=doy;
}

void Document::setcustomeraddress(QString address)
{
    mcustomeraddress=address;
}

void Document::setcustomercity(QString city)
{
    mcustomercity=city;
}

void Document::setdeliveryaddress(QString deliveryaddress)
{
    mdeliveryaddress=deliveryaddress;
}

void Document::settvalue(QString value)
{
    mtvalue=QString::number(value.toFloat(), 'f', 2).rightJustified(8,' ');
}

void Document::settvat(QString vat)
{
    mtvat=QString::number(vat.toFloat(), 'f', 2).rightJustified(8,' ');
}

void Document::settotal(QString total)
{
    mtotal=QString::number(total.toFloat(), 'f', 2).rightJustified(8,' ');
}

void Document::printdocument()
{
    /*
    QString command;
    QByteArray ba;
    command="! U1 setvar \"device.languages\" \"zpl\"";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    //socket.write(ba);
    command="^XA";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^MNN^LL950";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^CWT,E:TT0003M_.TTF";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());

    command="^CFT,30,30";

    //command="^XA^CWZ,E:ARIAL10P.CPF^FS^XZ";
    //command="^XA^CWZ,E:TT0003M_.TTF^FS^XZ";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    //command="^FO0,50^CI28^ATN,36,20^FH^FD- Swiss 721 Greek: ΆΈΉΊΌΐΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΪΫ";
    command="^FO175,50^CI28^ATN,36,20^FH^FDΠΑΣΧΑΛΗΣ ΓΚΟΥΔΙΝΑΚΗΣ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO200,100^CI28^ATN,36,20^FH^FDΕΜΠΟΡΙΑ ΠΑΓΟΥ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO185,150^CI28^ATN,36,20^FH^FDΧΑΛΚΕΡΟ ΚΑΒΑΛΑΣ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO125,200^CI28^ATN,36,20^FH^FDΑΦΜ:027445258 - ΔΟΥ:ΚΑΒΑΛΑΣ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO125,250^CI28^ATN,36,20^FH^FDΤΗΛ:6947 613893 - 6947 613894^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO0,300^GB598,0,8^fs";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    //INVOICE DATA
    command="^FO0,330^CI28^ATN,27,15^FH^FDΤΙΜΟΛΟΓΙΟ ΠΩΛΗΣΗΣ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO250,330^CI28^ATN,27,15^FH^FD1789^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO400,330^CI28^ATN,27,15^FH^FD12/12/2014^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());return mtvat;
    command="^FO500,330^CI28^ATN,27,15^FH^FD12:45^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO0,360^GB598,0,8^fs";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    //CUSTOMER DATA
    command="^FO50,380^CI28^ATN,36,20^FH^FDΠΕΛΑΤΗΣ:^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO150,380^CI28^ATN,36,20^FH^FDΠΑΡΑΣΧΟΥ ΔΗΜΗΤΡΗΣ:^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO150,420^CI28^ATN,36,20^FH^FDΕΜΠΟΡΙΟ ΩΩΝ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO50,460^CI28^ATN,36,20^FH^FDΠΑΡΟΔΟΣ ΟΜΟΝΟΙΑΣ 26-28^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO425,460^CI28^ATN,36,20^FH^FDΚΑΒΑΛΑ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO100,500^CI28^ATN,36,20^FH^FDΑΦΜ:027445258^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO350,500^CI28^ATN,36,20^FH^FDΔΟΥ:ΚΑΒΑΛΑΣ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO0,540^GB598,0,8^fs";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    //DETAILS HEADER
    command="^FO0,560^CI28^ATN,27,15^FH^FDΕΙΔΟΣ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO250,560^CI28^ATN,27,15^FH^FDΜΜ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO300,560^CI28^ATN,27,15^FH^FDΠΟΣΟΤΗΤΑ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO400,560^CI28^ATN,27,15^FH^FDΤΙΜΗ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO450,560^CI28^ATN,27,15^FH^FDΑΞΙΑ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO525,560^CI28^ATN,27,15^FH^FDΦΠΑ%^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO0,590^GB598,0,8^fs";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    //DETAILS
    command="^FO0,610^CI28^ATN,27,15^FH^FDΠΑΓΑΚΙ ΣΑΚΟΥΛΑ 5 ΚΙΛΩΝ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO250,610^CI28^ATN,27,15^FH^FDΤΕΜ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO300,610^CI28^ATN,27,15^FH^FD5^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO400,610^CI28^ATN,27,15^FH^FD2,65^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO450,610^CI28^ATN,27,15^FH^FD15,80^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO525,610^CI28^ATN,27,15^FH^FD23%^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO0,640^CI28^ATN,27,15^FH^FDΠΑΓΟΣ ΤΡΙΜΑ ΣΑΚΟΥΛΑ 2.5 ΚΙΛΩΝ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO250,640^CI28^ATN,27,15^FH^FDΤΕΜ^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO300,640^CI28^ATN,27,15^FH^FD15^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO400,640^CI28^ATN,27,15^FH^FD3,65^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO450,640^CI28^ATN,27,15^FH^FD150,80^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO525,640^CI28^ATN,27,15^FH^FD23%^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO0,670^GB598,0,8^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    //test
    command="^FO525,700^CI28^ATN,27,15^FH^FD23%^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FO0,750^GB598,0,8^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());

    //TOTALS

    command="^FΟ250,690^CI28^ATN,36,20^FH^FDΚΑΘΑΡΗ ΑΞΙΑ:^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FΟ550,690^CI28^ATN,36,20^FH^FD1453,75^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FΟ250,740^CI28^ATN,36,20^FH^FDΦΠΑ:^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FΟ550,740^CI28^ATN,36,20^FH^FD153,75^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FΟ250,790^CI28^ATN,36,20^FH^FDΠΛΗΡΩΤΕΟ:^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^FΟ550,790^CI28^ATN,36,20^FH^FD2153,75^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());


    //QTextCodec *codec = QTextCodec::codecForName("Windows-1253");
    //ba = codec->fromUnicode(command)+"\n";
    //ba=command.TO+"\n";
    //socket->write(ba,ba.length());
    command="^FS";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    command="^XZ";
    ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());
    */
    qDebug()<<"MPIKA GIA EKTYPVSi";
    //COMPANY DATA
    send("! U1 setvar \"device.languages\" \"zpl\"");
    send("^XA");
    send("^MMC,Y");
    send("^MNN^LL1200");
    send("^CWT,E:TT0003M_.TTF");
    send("^CFT,30,30");
    send("^FO175,100^CI28^ATN,36,20^FH^FD"+companyname()+"^FS");
    send("^FO200,150^CI28^ATN,36,20^FH^FD"+companyoccupation()+"^FS");
    send("^FO185,200^CI28^ATN,36,20^FH^FD"+companyaddress()+" "+companycity()+"^FS");
    send("^FO125,250^CI28^ATN,36,20^FH^FDΑΦΜ:"+companyafm()+" - ΔΟΥ:"+companydoy()+"^FS");
    send("^FO125,300^CI28^ATN,36,20^FH^FDΤΗΛ:"+companytel1()+" - "+companytel2()+"^FS");
    send("^FO125,350^CI28^ATN,36,20^FH^FDEMAIL:"+companyemail()+"^FS");
    send("^FO0,400^GB598,0,8^fs");
    //INVOICE DATA
    send("^FO0,430^CI28^ATN,27,15^FH^FD"+documenttype()+"^FS");
    send("^FO200,430^CI28^ATN,27,15^FH^FDΣΕΙΡΑ: "+documentseries()+"^FS");
    send("^FO300,430^CI28^ATN,27,15^FH^FDΑΡ.: "+documentnumber()+"^FS");
    send("^FO400,430^CI28^ATN,27,15^FH^FD"+documentdate()+"^FS");
    send("^FO500,430^CI28^ATN,27,15^FH^FD"+documenttime()+"^FS");
    send("^FO0,460^GB598,0,8^fs");
    //CUSTOMER DATA
    //send("^FO50,480^CI28^ATN,36,20^FH^FDΠΕΛΑΤΗΣ:^FS");
    send("^FO050,480^CI28^ATN,36,20^FH^FD"+customername()+"^FS");
    send("^FO050,520^CI28^ATN,36,20^FH^FD"+customeroccupation()+"^FS");
    send("^FO50,560^CI28^ATN,36,20^FH^FD"+customeraddress()+"^FS");
    send("^FO425,560^CI28^ATN,36,20^FH^FD"+customercity()+"^FS");
    send("^FO050,600^CI28^ATN,36,20^FH^FDΑΦΜ:"+customerafm()+"^FS");
    send("^FO250,600^CI28^ATN,36,20^FH^FDΔΟΥ:"+customerdoy()+"^FS");
    send("^FO50,640^CI28^ATN,27,15^FH^FDΔΙΕΥΘ.ΠΑΡΑΔΟΣΗΣ:^FS");
    send("^FO200,640^CI28^ATN,27,15^FH^FD"+deliveryaddress()+"^FS");
    send("^FO0,680^GB598,0,8^fs");
    //DETAILS HEADER
    send("^FO0,700^CI28^ATN,27,15^FH^FD"+captions.at(0)+"^FS");
    send("^FO250,700^CI28^ATN,27,15^FH^FD"+captions.at(1)+"^FS");
    send("^FO300,700^CI28^ATN,27,15^FH^FD"+captions.at(2)+"^FS");
    send("^FO400,700^CI28^ATN,27,15^FH^FD"+captions.at(3)+"^FS");
    send("^FO450,700^CI28^ATN,27,15^FH^FD"+captions.at(4)+"^FS");
    send("^FO525,700^CI28^ATN,27,15^FH^FD"+captions.at(5)+"^FS");
    send("^FO0,730^GB598,0,8^FS");
    //DETAILS
    QVariant globaly;
    for(int i=0;i<lines.size();i++)
    {
        qDebug()<<"i:"<<i;
        QStringList line=lines.at(i);
        qDebug()<<"VGIKA:"<<line;
        QVariant y=750+30*i;

        send("^FO0,"+y.toString()+"^CI28^ATN,27,15^FH^FD"+line.at(0)+"^FS");
        send("^FO250,"+y.toString()+"^CI28^ATN,27,15^FH^FD"+line.at(1)+"^FS");
        send("^FO300,"+y.toString()+"^CI28^ATN,27,15^FH^FD"+line.at(2).rightJustified(4,' ')+"^FS");

        send("^FO400,"+y.toString()+"^CI28^ATN,27,15^FH^FD"+QString::number(line.at(3).toFloat(), 'f', 2).rightJustified(6,' ')+"^FS");
        send("^FO450,"+y.toString()+"^CI28^ATN,27,15^FH^FD"+QString::number(line.at(4).toFloat(), 'f', 2).rightJustified(7,' ')+"^FS");
        send("^FO525,"+y.toString()+"^CI28^ATN,27,15^FH^FD"+line.at(5).rightJustified(2,' ')+"^FS");
        globaly=y;

    }

    globaly=globaly.toInt()+50;
    send("^FO0,"+globaly.toString()+"^GB598,0,8^FS");

    //TOTALS
    globaly=globaly.toInt()+40;
    send("^FO250,"+globaly.toString()+"^CI28^ATN,36,20^FH^FDΚΑΘΑΡΗ ΑΞΙΑ:^FS");
    send("^FO500,"+globaly.toString()+"^CI28^ATN,36,20^FH^FD"+tvalue()+"^FS");

    globaly=globaly.toInt()+40;

    send("^FO250,"+globaly.toString()+"^CI28^ATN,36,20^FH^FDΦΠΑ:^FS");
    send("^FO500,"+globaly.toString()+"^CI28^ATN,36,20^FH^FD"+tvat()+"^FS");

    globaly=globaly.toInt()+40;
    send("^FO0,"+globaly.toString()+"^GB598,0,8^FS");

    globaly=globaly.toInt()+40;

    send("^FO250,"+globaly.toString()+"^CI28^ATN,54,20^FH^FDΠΛΗΡΩΤΕΟ:^FS");
    send("^FO500,"+globaly.toString()+"^CI28^ATN,54,20^FH^FD"+total()+"^FS");

    /*
    send("^FΟ250,"+globaly.toString()+"^CI28^ATN,36,20^FH^FDΠΛΗΡΩΤΕΟ:^FS");
    send("^FΟ550,"+globaly.toString()+"^CI28^ATN,36,20^FH^FD"+total()+"^FS");
    */
    send("^FS");
    send("^XZ");


}

void Document::send(QString command)
{

    QByteArray ba=command.toUtf8()+"\n";
    socket->write(ba,ba.length());


}



