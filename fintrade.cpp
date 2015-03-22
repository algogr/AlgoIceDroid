#include "fintrade.h"
//#include "sqlquerymodel.h"

fintrade::fintrade(QObject *parent) :
    QObject(parent)
{
    //QList <storetradeline> mtradeline;
}


QString fintrade::id()
{
    return mid;
}

QString fintrade::ftrdate()
{
    return mftrdate;
}

QString fintrade::ftrtime()
{
    return mftrtime;
}

QString fintrade::dsrid()
{
    return mdsrid;
}

QString fintrade::dsrnumber()
{
    return mdsrnumber;
}

QString fintrade::cusid()
{
    return mcusid;
}

QString fintrade::salesmanid()
{
    return msalesmanid;
}

QString fintrade::comments()
{
    return mcomments;
}
\
QString fintrade::deliveryaddress()
{
    return mdeliveryaddress;
}

QString fintrade::erpupd()
{
    return merpupd;
}

QString fintrade::netvalue()
{
    return mnetvalue;
}

QString fintrade::vatamount()
{
    return mvatamount;
}

QString fintrade::totamount()
{
    return mtotamount;
}

QString fintrade::cash()
{
    return mcash;
}

QList<QObject*> fintrade::lines()
{
    return mlines;
}

void fintrade::setId(QString id)
{
    mid=id;
}

void fintrade::setFtrdate(QString ftrdate)
{
    mftrdate=ftrdate;
}

void fintrade::setFtrtime(QString ftrtime)
{
    mftrtime=ftrtime;
}

void fintrade::setDsrid(QString dsrid)
{
    mdsrid=dsrid;
}

void fintrade::setDsrnumber(QString dsrnumber)
{
    mdsrnumber=dsrnumber;
}

void fintrade::setCusid(QString cusid)
{
    mcusid=cusid;
}

void fintrade::setSalesmanid(QString salesmanid)
{
    msalesmanid=salesmanid;
}

void fintrade::setComments(QString comments)
{
    mcomments=comments;
}

void fintrade::setDeliveryaddress(QString deliveraddress)
{
    mdeliveryaddress=deliveraddress;
}

void fintrade::setErpupd(QString erpupd)
{
    merpupd=erpupd;
}

void fintrade::setNetvalue(QString netvalue)
{
    mnetvalue=netvalue;
}

void fintrade::setVatamount(QString vatamount)
{
    mvatamount=vatamount;
}

void fintrade::setTotamount(QString totamount)
{
    mtotamount=totamount;
}

void fintrade::setCash(QString cash)
{
    mcash=cash;
}

void fintrade::setLines(const QList<QObject*> &lines)
{
    /*
    for (int i=0;i<tradelines.size();i++)
    {
        mtradelines.append(dynamic_cast<storetradeline*>(tradelines.at(i)));
    }
    */
    mlines=lines;
    qDebug()<<mlines;
}

QString fintrade::insert_db()
{
    QString a=sqlquerymodel::insert_invoice(this);
    setId(a);
    return a;

}

void fintrade::delete_db(QString ftrid)
{
    sqlquerymodel::deleteDocument(ftrid);
    return;
}

QString fintrade::last_no(QString type)
{
    QString lastno=sqlquerymodel::get_docseries_lastno(type);
    return lastno;
}

void fintrade::print(QBluetoothSocket *socket)
{
    if(mid!="")
    {

        Document *doc=new Document(0,socket);
        qDebug()<<"SOCKET:"<<socket;
        QVariant name=sqlquerymodel::getCustomerField(this->cusid(),"name");
        qDebug()<<"NAME:"<<name;
        doc->setcustomername(sqlquerymodel::getCustomerField(this->cusid(),"name").toString());
        doc->setcustomeroccupation(sqlquerymodel::getCustomerField(this->cusid(),"occupation").toString());
        doc->setcustomeraddress(sqlquerymodel::getCustomerField(this->cusid(),"address").toString());
        doc->setcustomercity(sqlquerymodel::getCustomerField(this->cusid(),"city").toString());
        doc->setcustomerafm(sqlquerymodel::getCustomerField(this->cusid(),"afm").toString());
        doc->setcustomerdoy(sqlquerymodel::getCustomerField(this->cusid(),"doy").toString());

        QString type;
        switch (this->dsrid().toInt())
        {
            case 1:
            type="ΤΙΜΟΛΟΓΙΟ ΠΩΛΗΣΗΣ";
            break;
            case 2:
            type="ΠΙΣΤΩΤΙΚΟ ΤΙΜΟΛΟΓΙΟ";
            break;
            case 3:
            type="ΔΕΛΤΙΟ ΑΠΟΣΤΟΛΗΣ";
            break;
            case 4:
            type="ΔΕΛΤΙΟ ΕΠΙΣΤΡΟΦΗΣ";
            break;

        }

        doc->setdocumenttype(type);

        doc->setdocumentnumber(this->dsrnumber());
        doc->setdocumentdate(this->ftrdate());
        doc->setdocumenttime(this->ftrtime());
        doc->setdocumentseries(sqlquerymodel::getsalesmanid());
        qDebug()<<"SERIES:"<<doc->documentseries();
        if(this->deliveryaddress()=="")
            doc->setdeliveryaddress(doc->customeraddress());
        else
            doc->setdeliveryaddress(this->deliveryaddress());
        doc->settvalue(this->netvalue());
        doc->settvat(this->vatamount());
        doc->settotal(this->totamount());
        doc->captions<<"ΕΙΔΟΣ"<<"ΜΜ"<<"ΠΟΣΟΤΗΤΑ"<<"ΤΙΜΗ"<<"ΑΞΙΑ"<<"ΦΠΑ%";
        for(int i=0;i<mlines.size();i++)
        {

            storetradeline *line=dynamic_cast<storetradeline*>(mlines.at(i));

            QStringList docline;

            docline<<sqlquerymodel::getItemField(line->iteid(),"description").toString()<<\
                     sqlquerymodel::getItemField(line->iteid(),"unit").toString()<<\
                     line->primaryqty()<<line->price()<<line->linevalue()<<line->vatid();

            doc->lines.append(docline);


        }
        qDebug()<<"EDV";
        doc->printdocument();
    }
}


