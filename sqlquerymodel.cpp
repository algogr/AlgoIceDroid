#include "sqlquerymodel.h"
#include <QDir>
#include "entitydisplay.h"


sqlquerymodel::sqlquerymodel(QObject *parent) :
    QObject(parent)
{
}

bool sqlquerymodel::opendb()

{
    QFile dfile("assets:/db/algoicedroid.db");
            if (dfile.exists())
            {
                dfile.copy("./algoicedroid.db");
                QFile::setPermissions("./algoicedroid.db",QFile::WriteOwner | QFile::ReadOwner);
            }

    mydb = QSqlDatabase::addDatabase("QSQLITE");
    bool open;
    // Adjust for Windows, OSX or Symbian deploy
    //mydb.setDatabaseName("/home/jim/workspace/HourGlassDroid/hourglass.sqlite");
    QString dbpath = QDir::currentPath()+"/";

    //mydb.setDatabaseName(dbpath+"algoicedroid.db");
    mydb.setDatabaseName("./algoicedroid.db");
    //mydb.setDatabaseName("/data/app/hourglass.sqlite");
    open=mydb.open();
    qDebug()<< mydb <<mydb.isOpen();
    if (!open)
    {
        qDebug()<<mydb.lastError();
    }
    qDebug()<<"Anoixa:"<<open;
    return open;
}

QVariant sqlquerymodel::getCustomerField(QString cusid,QString fieldname)
{
    QSqlQuery query;
    QString querystr="SELECT *,d.description as district,dy.description as doy,o.description as occupation \
            from customer c,district d,doy dy,occupation o,vatstatus v,\
            custfindata cf where c.districtid=d.id and c.id=cf.cusid \
            and c.doyid=dy.id and c.ocpid=o.id and c.vatstatusid=v.codeid and c.id="+cusid;
    //qDebug()<<querystr;
    query.exec(querystr);
    QSqlRecord rec = query.record();
    //qDebug() << "Number of columns: " << rec.count();

    QString Col;
    for (int i=0;i<rec.count();i++)
    {
        Col = rec.fieldName(i);
        //qDebug()<<Col;
    }


    query.next();
    QVariant value = query.value(fieldname);
    //qDebug()<<"descr:"<<value;
    return value;

}

QList <QObject*>  sqlquerymodel::getCustomerListbyDistrict(QString districtid)
{
    //opendb();
    QSqlQuery query;
    QString querystr="select c.id,c.name,c.title from customer c where c.districtid="+districtid;
    query.exec(querystr);
    QList <QObject*> customers;
    while(query.next())
    {
        Customer* customer=new Customer();
        customer->setId(query.value(0).toString());
        customer->setName(query.value(1).toString());
        customer->setTitle(query.value(2).toString());
        customers.append(customer);

    }
    return customers;

}


QList <QObject*> sqlquerymodel::getDistrictList()
{
    opendb();
    QSqlQuery query;
    QString querystr="select d.id,d.description,d.city,d.erpid,d.county from district d order by d.description";
    //qDebug()<<querystr;
    query.exec(querystr);
    QList <QObject*> districts;
    while(query.next())
    {
        District* district=new District();
        district->setId(query.value(0).toString());
        district->setDescription(query.value(1).toString());
        district->setCity(query.value(2).toString());
        district->setErpid(query.value(3).toString());
        district->setCounty(query.value(4).toString());
        districts.append(district);
    }
    return districts;

}

QList <QObject*> sqlquerymodel::CustomerData(QString cusid)
{
    QList <QString> titles;
    titles << "Επωνυμία:"<<"Τίτλος"<<"Διεύθυνση:"<<"Περιοχή:"<<"Πόλη:"<<"ΑΦΜ:"<<"ΔΟΥ:"<<"Τηλ.1:"<<\
              "Τηλ.2:"<<"Fax:"<<"Email:"<<"Yπόλοιπο:";
    //qDebug()<<titles.size()<<titles;
    QList <QString> fieldnames;
    fieldnames<<"name"<<"title"<<"address"<<"district"<<"city"<<"afm"<<"doy"<<"tel1"<<"tel2"<<"fax"<<"email"<<"balance";
    QList <bool> editable;
    editable<<true<<true<<true<<true<<false<<true<<true<<true<<true<<true<<true<<false;
    QList <QString> relatedentity;
    relatedentity<<""<<""<<""<<"District"<<""<<""<<"Doy"<<""<<""<<""<<""<<"";
    QList <QObject*> custdata;
    for (int i=0;i<titles.size();i++)
    {
        EntityDisplay* field=new EntityDisplay();
        field->setTitle(titles[i]);
        field->setValue(getCustomerField(cusid,fieldnames[i]).toString());
        field->setFieldname(fieldnames[i]);
        field->setEditable(editable[i]);
        field->setRelatedentity(relatedentity[i]);
        custdata.append(field);
    }

    qDebug()<<"CUSTDATA:"<<custdata;
    return custdata;


}

void sqlquerymodel::updateCustomerField(QString cusid, QString fieldname, QString value)
{
    QSqlQuery query;
    QString querystr="update customer set "+fieldname+"='"+value+"' where id="+cusid;
    //qDebug()<<querystr;
    query.exec(querystr);

}

void sqlquerymodel::updateCustomerBalance(QString cusid, QString amount)
{
    QSqlQuery query;
    QString querystr="update custfindata set balance=balance-"+amount+" where cusid="+cusid;
    qDebug()<<querystr;
    query.exec(querystr);
}

QList<QObject*> sqlquerymodel::getItemList()
{
    QSqlQuery query;
    QString querystr="select id,code,description,price,vatid,maxdiscount from material";
    query.exec(querystr);
    QList <QObject*> items;
    while(query.next())
    {
        Item *item=new Item();
        item->setId(query.value(0).toString());
        item->setCode(query.value(1).toString());
        item->setDescription(query.value(2).toString());
        item->setPrice(query.value(3).toString());
        item->setVatid(query.value(4).toString());
        item->setMaxdiscount(query.value(5).toString());
        items.append(item);
    }


    return items;
}

QVariant sqlquerymodel::getItemField(QString iteid, QString fieldname)
{

}

int sqlquerymodel::insert_invoice(fintrade *fin)
{
    QSqlQuery query;
    QString querystr="INSERT into fintrade (ftrdate,dsrid,dsrnumber,cusid,salesmanid,comments,deliveryaddress,erpupd,netvalue,"\
                      "vatamount,totamount) VALUES('"+fin->ftrdate()+"','"+fin->dsrid()+"','"+fin->dsrnumber()+"','"+fin->cusid()+"','"\
                                                  +fin->salesmanid()+"','"+fin->comments()+"','"+fin->deliveryaddress()+"','"+\
                                                  fin->erpupd()+"','"+fin->netvalue()+"','"+fin->vatamount()+"','"+fin->totamount()+"')";

    qDebug()<<"INSRT INVOICE:"<<querystr;
    query.exec(querystr);
    querystr="update docseries set lastno='"+fin->dsrnumber()+"' where codeid='"+fin->dsrid()+"'";
    query.exec(querystr);
    querystr="select id from fintrade where ftrdate='"+fin->ftrdate()+"'";
    query.exec(querystr);
    query.next();
    int l=query.value(0).toInt();
    qDebug()<<"ID:"<<l;
    return l;
}

QString sqlquerymodel::get_docseries_lastno(QString type)
{
    QSqlQuery query;
    QString querystr="select lastno from docseries where codeid='"+type+"'";
    query.exec(querystr);
    query.next();
    QVariant lastno=query.value(0).toInt()+1;
    return lastno.toString();
}
