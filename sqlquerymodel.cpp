#include "sqlquerymodel.h"
#include <QDir>




sqlquerymodel::sqlquerymodel(QObject *parent) :
    QObject(parent)
{
}

bool sqlquerymodel::opendb()

{
    /*
    QFile dfile("assets:/db/algoicedroid.db");
            if (dfile.exists())
            {
                dfile.copy("./algoicedroid.db");
                QFile::setPermissions("./algoicedroid.db",QFile::WriteOwner | QFile::ReadOwner);
            }
*/
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

void sqlquerymodel::closedb()
{
    mydb.close();

}

QVariant sqlquerymodel::getCustomerField(const QString& cusid,const QString& fieldname)
{
    QSqlQuery query;
    QString querystr="SELECT *,ifnull((select balance from custfindata cf where cf.cusid=c.id ),0) as balance,r.description \
            as route,dy.description as doy,v.description as vatstatus\
            from customer c,route r,doy dy,vatstatus v\
             where c.routeid=r.erpid  \
            and c.doyid=dy.erpid  and c.vatstatusid=v.codeid and c.id="+cusid;
    qDebug()<<querystr;
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
    qDebug()<<"descr:"<<value;
    return value;

}

QVariant sqlquerymodel::getFintradeField(const QString& ftrid,const QString& fieldname)
{
    QSqlQuery query;
    QString querystr="SELECT * from fintrade where id="+ftrid;
    //qDebug()<<querystr;
    query.exec(querystr);
    QSqlRecord rec = query.record();
    //qDebug() << "Number of columns: " << rec.count();

    QString Col;
    for (int i=0;i<rec.count();i++)
    {
        Col = rec.fieldName(i);

    }


    query.next();
    QVariant value = query.value(fieldname);

    return value;

}


QVariant sqlquerymodel::getCashtrnField(const QString& id,const QString& fieldname)
{
    QSqlQuery query;
    QString querystr="SELECT * from cashtrn where id="+id;

    query.exec(querystr);
    QSqlRecord rec = query.record();


    QString Col;
    for (int i=0;i<rec.count();i++)
    {
        Col = rec.fieldName(i);

    }


    query.next();
    QVariant value = query.value(fieldname);

    return value;

}


QList <QObject*> sqlquerymodel::getCustomerBalance()
{
    opendb();
    QSqlQuery query;
    QString querystr="select c.name,cf.balance from customer c,custfindata cf where c.id=cf.cusid";
    query.exec(querystr);
    qDebug()<<querystr;
    QList<QObject*> custbalancereport;
    while(query.next())
    {
        Presentation* cust=new Presentation;
        cust->setRole1(query.value(0).toString());
        cust->setRole2(query.value(1).toString());
        custbalancereport.append(cust);
    }

    return custbalancereport;

}





QList <QObject*>  sqlquerymodel::getCustomerListbyRoute(const QString& routeid)
{
    //opendb();
    QSqlQuery query;
    QString querystr="select c.erpid,c.name,c.title from customer c where c.routeid="+routeid+" order by c.name";
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

QList <QObject*>  sqlquerymodel::getCustomerListbyRoute(const QString& routeid,const QString& phrase)
{
    //opendb();
    QSqlQuery query;
    QString querystr="select c.erpid,c.name,c.title from customer c where c.routeid="+routeid+\
            " and ((c.name like '%"+phrase+"%') or (c.title like '%"+phrase+"%')) order by c.name";
    qDebug()<<querystr;
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


QList <QObject*> sqlquerymodel::getRouteList()
{
    opendb();
    QSqlQuery query;
    QString querystr="select r.id,r.description,r.erpid from route r order by r.description";
    qDebug()<<querystr;
    query.exec(querystr);
    QList <QObject*> routes;
    while(query.next())
    {
        Route* route=new Route();
        route->setId(query.value(0).toString());
        route->setDescription(query.value(1).toString());
        route->setErpid(query.value(2).toString());
        routes.append(route);
    }
    return routes;

}

QList <QObject*> sqlquerymodel::CustomerData()
{
    QList <QString> titles;
    titles << "Επωνυμία:"<<"Τίτλος"<<"Καθεστώς ΦΠΑ:"<<"Διεύθυνση:"<<"Περιοχή:"<<"Πόλη:"<<"ΑΦΜ:"<<"Επάγγελμα:"<<"ΔΟΥ:"<<"Τηλ.1:"<<\
              "Τηλ.2:"<<"Fax:"<<"Email:"<<"Παρατήρησεις:";
    //qDebug()<<titles.size()<<titles;
    QList <QString> fieldnames;
    fieldnames<<"name"<<"title"<<"vatstatus"<<"address"<<"district"<<"city"<<"afm"<<"occupation"<<"doy"<<"tel1"<<"tel2"<<"fax"<<\
                "email"<<"comments";
    QList <QString> relatedentity;
    relatedentity<<""<<""<<"VatStatus"<<""<<""<<""<<""<<""<<"Doy"<<""<<""<<""<<""<<"";
    QList <bool> longtext;
    longtext<<false<<false<<false<<false<<false<<false<<false<<false<<false<<false<<false<<false<<false<<true;
    QList <QObject*> custdata;
    for (int i=0;i<titles.size();i++)
    {
        EntityDisplay* field=new EntityDisplay();
        field->setTitle(titles[i]);
        field->setFieldname(fieldnames[i]);
        field->setRelatedentity(relatedentity[i]);
        field->setLongtext(longtext[i]);
        custdata.append(field);
    }

    //qDebug()<<"CUSTDATA:"<<custdata;
    return custdata;


}


QList <QObject*> sqlquerymodel::CustomerData(const QString& cusid)
{
    QList <QString> titles;
    titles << "Επωνυμία:"<<"Τίτλος"<<"Διεύθυνση:"<<"Περιοχή:"<<"Πόλη:"<<"ΑΦΜ:"<<"Επάγγελμα:"<<"ΔΟΥ:"<<"Τηλ.1:"<<\
              "Τηλ.2:"<<"Fax:"<<"Email:"<<"Καθεστώς ΦΠΑ:"<<"Παρατήρησεις:"<<"Yπόλοιπο:";
    //qDebug()<<titles.size()<<titles;
    QList <QString> fieldnames;
    fieldnames<<"name"<<"title"<<"address"<<"district"<<"city"<<"afm"<<"occupation"<<"doy"<<"tel1"<<"tel2"<<"fax"<<"email"<<\
                "vatstatus"<<"comments"<<"balance";
    QList <bool> editable;
    editable<<true<<true<<true<<true<<true<<true<<true<<true<<true<<true<<true<<true<<true<<true<<false;
    QList <QString> relatedentity;
    relatedentity<<""<<""<<""<<""<<""<<""<<""<<"Doy"<<""<<""<<""<<""<<"VatStatus"<<""<<"";
    QList <bool> longtext;
    longtext<<false<<false<<false<<false<<false<<false<<false<<false<<false<<false<<false<<false<<false<<true<<false;
    QList <QObject*> custdata;
    for (int i=0;i<titles.size();i++)
    {
        EntityDisplay* field=new EntityDisplay();
        field->setTitle(titles[i]);
        field->setValue(getCustomerField(cusid,fieldnames[i]).toString());
        field->setFieldname(fieldnames[i]);
        field->setEditable(editable[i]);
        field->setRelatedentity(relatedentity[i]);
        field->setLongtext(longtext[i]);
        custdata.append(field);
    }

    qDebug()<<"CUSTDATA:"<<custdata;
    return custdata;


}

void sqlquerymodel::updateCustomerField(const QString& cusid,const QString& fieldname,const QString& value)
{
    QSqlQuery query;
    QString querystr="update customer set "+fieldname+"='"+value+"' where id="+cusid;
    qDebug()<<querystr;
    query.exec(querystr);
    querystr="select erpupd from customer where id="+cusid;
    query.exec(querystr);
    query.next();
    if(query.value(0).toInt()!=0)
    {
        querystr="update customer set erpupd=2 where id="+cusid;
        query.exec(querystr);
    }
}

void sqlquerymodel::updateCustomerBalance(const QString& cusid,const QString& amount)
{
    QSqlQuery query;
    QString querystr="update custfindata set balance=balance-"+amount+" where cusid="+cusid;
    qDebug()<<querystr;
    query.exec(querystr);
    QString customer=getCustomerField(cusid,"name").toString();
    querystr="INSERT INTO cashtrn (trndate,trntype,amount,justification,trncategory,perid) VALUES (date('now'),1,"+amount+",'"\
                +customer+"',"+"2,"+cusid+")";
    query.exec(querystr);
    qDebug()<<querystr;
}

QList<QObject*> sqlquerymodel::getItemList()
{
    opendb();
    QSqlQuery query;
    QString querystr="select m.id,m.code,m.description,m.price,m.vatid,m.maxdiscount,ifnull(sf.startqty,0),\
            ifnull(sf.startqty,0)-ifnull((select sum(st.primaryqty*doc.quantmode) from fintrade f,storetradelines st,\
            docseries doc where f.id=st.ftrid and doc.codeid=f.dsrid and st.iteid=m.id),0)\
             from material m left outer join storefindata sf on sf.iteid=m.id";
    query.exec(querystr);
    qDebug()<<querystr;
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
        item->setStartqty(query.value(6).toString());
        item->setRemainingqty(query.value(7).toString());
        items.append(item);
    }


    return items;
}

QVariant sqlquerymodel::getItemField(const QString& iteid,const QString& fieldname)
{
    QSqlQuery query;
    QString querystr="SELECT * from material where id="+iteid;
    //qDebug()<<querystr;
    query.exec(querystr);
    QSqlRecord rec = query.record();
    //qDebug() << "Number of columns: " << rec.count();

    QString Col;
    for (int i=0;i<rec.count();i++)
    {
        Col = rec.fieldName(i);

    }


    query.next();
    QVariant value = query.value(fieldname);

    return value;


}

QString sqlquerymodel::insert_invoice(fintrade *fin)
{
    QSqlQuery query;
    QString querystr="INSERT into fintrade (ftrdate,dsrid,dsrnumber,cusid,salesmanid,comments,deliveryaddress,erpupd,netvalue,"\
                      "vatamount,totamount,cash) VALUES('"+fin->ftrdate()+"','"+fin->dsrid()+"','"+fin->dsrnumber()+"','"+fin->cusid()+"','"\
                                                  +fin->salesmanid()+"','"+fin->comments()+"','"+fin->deliveryaddress()+"','"+\
                                                  fin->erpupd()+"','"+fin->netvalue()+"','"+fin->vatamount()+"','"+fin->totamount()+"','"+fin->cash()+"')";

    qDebug()<<"INSRT INVOICE:"<<querystr;
    query.exec(querystr);
    querystr="update docseries set lastno='"+fin->dsrnumber()+"' where codeid='"+fin->dsrid()+"'";
    query.exec(querystr);
    if (fin->cash()=="0")
    {
        querystr="update custfindata set balance=balance+"+fin->totamount()+"*(select valmode from docseries where codeid='"+fin->dsrid()+"') where cusid="+fin->cusid();
        query.exec(querystr);
        qDebug()<<querystr;

    }

    querystr="select id from fintrade where ftrdate='"+fin->ftrdate()+"'";
    query.exec(querystr);
    qDebug()<<"GET FTRID:"<<querystr;
    query.next();
    QString l=query.value(0).toString();
    qDebug()<<"ID:"<<l;
    if (fin->cash()=="1")
    {
        QString tamount=fin->totamount();
        if(fin->dsrid()=="2")
            tamount="-"+tamount;

        QString customer=sqlquerymodel::getCustomerField(fin->cusid(),"name").toString();
        querystr="INSERT INTO cashtrn (trndate,trntype,amount,justification,trncategory,ftrid,perid) VALUES (date('now'),1,"+tamount+",'"\
                    +customer+"',"+"1"+","+l+","+fin->cusid()+")";
        query.exec(querystr);
        qDebug()<<querystr;

    }

    return l;
}

QString sqlquerymodel::get_docseries_lastno(const QString& type)
{
    QSqlQuery query;
    QString querystr="select lastno from docseries where codeid='"+type+"'";
    query.exec(querystr);
    query.next();
    QVariant lastno=query.value(0).toInt()+1;
    return lastno.toString();
}

void sqlquerymodel::insertStoreTradeline(storetradeline *stl)
{
    QSqlQuery query;
    QString querystr="INSERT into storetradelines(iteid,ftrid,primaryqty,price,discount,discountpercent,linevalue,vatamount,vatid)"\
            " VALUES ('"+stl->iteid()+"','"+stl->ftrid()+"','"+stl->primaryqty()+"','"+stl->price()+"','"+stl->discount()+"','"\
            +stl->discountpercent()+"','"+stl->linevalue()+"','"+stl->vatamount()+"','"+stl->vatid()+"')";
    qDebug()<<querystr;
    query.exec(querystr);
    querystr="UPDATE storefindata set qty=ifnull(qty,0)+(select quantmode from docseries dc,fintrade f where f.dsrid=dc.id and f.id="+stl->ftrid()+\
            ")*"+stl->primaryqty()+" where iteid="+stl->iteid();
    query.exec(querystr);
    qDebug()<<querystr;

}

void sqlquerymodel::deleteDocument(const QString& ftrid)
{
    QSqlQuery query;
    QString querystr="select iteid,primaryqty from storetradelines where ftrid="+ftrid;
    query.exec(querystr);
    while(query.next())
    {
        QSqlQuery query1;
        QString querystr1="UPDATE storefindata set qty=ifnull(qty,0)-(select quantmode from docseries dc,fintrade f where f.dsrid=dc.id and f.id="+ftrid+\
                ")*"+query.value(0).toString()+" where iteid="+query.value(1).toString();
        query1.exec(querystr1);


    }
    querystr="INSERT INTO fintrade_deleted (id,ftrdate,dsrid,dsrnumber,cusid,salesmanid,comments,deliveryaddress,erpupd,netvalue,\
            vatamount,totamount,cash) select id,ftrdate,dsrid,dsrnumber,cusid,salesmanid,comments,deliveryaddress,erpupd,netvalue,\
            vatamount,totamount,cash from fintrade where id="+ftrid;
    qDebug()<<querystr;
    query.exec(querystr);
    querystr="INSERT INTO storetradelines_deleted (id,iteid,ftrid,primaryqty,price,discount,discountpercent,linevalue,vatamount,vatid)\
            SELECT id,iteid,ftrid,primaryqty,price,discount,discountpercent,linevalue,vatamount,vatid from storetradelines where ftrid=\
            "+ftrid;
    qDebug()<<querystr;
    query.exec(querystr);
    querystr="DELETE from storetradelines where ftrid='"+ftrid+"'";
    query.exec(querystr);
    qDebug()<<querystr;
    querystr="DELETE from fintrade where id="+ftrid;
    query.exec(querystr);
    qDebug()<<querystr;
    querystr="DELETE from cashtrn where ftrid="+ftrid;
    query.exec(querystr);
    qDebug()<<querystr;




}

QList<QObject*> sqlquerymodel::getItemTrans(const QString& iteid)
{
    QSqlQuery query;
    QString querystr="select c.name,doc.shortdescr || f.dsrnumber,stl.primaryqty*doc.quantmode,f.id from customer c,fintrade f,storetradelines stl,"\
            "docseries doc where c.id=f.cusid and doc.id=f.dsrid and f.id=stl.ftrid and f.erpupd=0 and stl.iteid="+iteid;
    query.exec(querystr);
    qDebug()<<querystr;
    QList<QObject*> transactions;
    while (query.next())
    {
        Presentation* transaction=new Presentation();
        transaction->setRole1(query.value(0).toString());
        transaction->setRole2(query.value(1).toString());
        transaction->setRole3(query.value(2).toString());
        transaction->setRole4(query.value(3).toString());
        transactions.append(transaction);

    }
    return transactions;

}

QList<QObject*> sqlquerymodel::getTradelines(const QString& ftrid)
{
    QSqlQuery query;
    QString querystr="select m.description,st.price,st.primaryqty,st.discount,st.discountpercent,st.linevalue,st.vatamount,st.vatid "\
            "from material m,storetradelines st where m.id=st.iteid and st.ftrid="+ftrid;
    query.exec(querystr);
    //qDebug()<<querystr;
    QList<QObject*> tradelines;
    while (query.next())
    {
        Presentation *tradeline=new Presentation;
        tradeline->setRole1(query.value(0).toString());
        tradeline->setRole2(query.value(1).toString());
        tradeline->setRole3(query.value(2).toString());
        tradeline->setRole4(query.value(3).toString());
        tradeline->setRole5(query.value(4).toString());
        tradeline->setRole6(query.value(5).toString());
        tradeline->setRole7(query.value(6).toString());
        tradeline->setRole8(query.value(7).toString());
        tradelines.append(tradeline);
    }

        return tradelines;
}

QList<QObject*> sqlquerymodel::getStoreTradelines(const QString& ftrid)
{
    QSqlQuery query;
    QString querystr="select st.iteid,st.price,st.primaryqty,st.discount,st.discountpercent,st.linevalue,st.vatamount,st.vatid "\
            "from storetradelines st where st.ftrid="+ftrid;
    query.exec(querystr);
    qDebug()<<querystr;
    QList<QObject*> tradelines;
    while (query.next())
    {
        storetradeline *tradeline=new storetradeline;
        tradeline->setIteid(query.value(0).toString());
        tradeline->setPrice(query.value(1).toString());
        tradeline->setPrimaryqty(query.value(2).toString());
        tradeline->setDiscount(query.value(3).toString());
        tradeline->setDiscountpercent(query.value(4).toString());
        tradeline->setLinevalue(query.value(5).toString());
        tradeline->setVatamount(query.value(6).toString());
        tradeline->setVatid(query.value(7).toString());
        tradelines.append(tradeline);
    }

        return tradelines;
}


QList<QObject*> sqlquerymodel::getInvoices()
{
    opendb();
    QSqlQuery query;
    QString querystr="select c.name,doc.shortdescr || f.dsrnumber,f.totamount,f.id from customer c,fintrade f,"\
            "docseries doc where c.id=f.cusid and doc.id=f.dsrid and f.erpupd=0";
    query.exec(querystr);
    qDebug()<<querystr;
    QList<QObject*> invoices;
    while(query.next())
    {
        Presentation* invoice=new Presentation;
        invoice->setRole1(query.value(0).toString());
        invoice->setRole2(query.value(1).toString());
        invoice->setRole3(query.value(2).toString());
        invoice->setRole4(query.value(3).toString());
        invoices.append(invoice);
    }

    return invoices;
}

QList<QObject*> sqlquerymodel::getIncomeList()
{
    //opendb();
    QSqlQuery query;
    QString querystr="select c.name,case  when ct.ftrid is null then 'Απόδειξη'"\
                     "else (select doc.shortdescr || f.dsrnumber from fintrade f,docseries doc "\
            "where f.dsrid=doc.codeid and f.id=ct.ftrid)"\
             "end,ct.amount,case  when ct.ftrid is null then ct.id else ct.ftrid end from customer c,cashtrn ct where "\
            "ct.perid=c.id and ct.trntype=1";
    query.exec(querystr);
    qDebug()<<querystr;
    QList<QObject*> invoices;
    while(query.next())
    {
        Presentation* invoice=new Presentation;
        invoice->setRole1(query.value(0).toString());
        invoice->setRole2(query.value(1).toString());
        invoice->setRole3(query.value(2).toString());
        invoice->setRole4(query.value(3).toString());
        invoices.append(invoice);
    }

    return invoices;
}

QList<QObject*> sqlquerymodel::getExpensesList()
{
    QSqlQuery query;
    QString querystr="select ct.trncategory,ct.justification,ct.amount,ct.id from cashtrn ct where ct.trntype=2";
    query.exec(querystr);
    qDebug()<<querystr;
    QList<QObject*> expenses;
    while(query.next())
    {
        Presentation* expense=new Presentation;
        expense->setRole1(query.value(0).toString());
        expense->setRole2(query.value(1).toString());
        expense->setRole3(query.value(2).toString());
        expense->setRole4(query.value(3).toString());
        expenses.append(expense);
    }

    return expenses;
}

QString sqlquerymodel::getCashOpening()
{
    opendb();
    QSqlQuery query;
    QString querystr="select amount from cashtrn where trntype=0";
    query.exec(querystr);
    if (!query.next())
        return "0";
    else
        return query.value(0).toString();


}
void sqlquerymodel::setCashOpening(const QString& amount)
{
    opendb();
    QSqlQuery query;
    QString querystr="select amount from cashtrn where trntype=0";
    query.exec(querystr);
    if(! query.next())
    {
        querystr="INSERT INTO cashtrn (trndate,trntype,amount,justification) VALUES (date('now'),0,"+amount+",'Άνοιγμα Ταμείου')";
        qDebug()<<querystr;
        query.exec(querystr);
    }

    else
    {
        querystr="UPDATE cashtrn set amount="+amount+" where trntype=0";
        query.exec(querystr);
        qDebug()<<querystr;
    }

    return;
}

void sqlquerymodel::insertExpense(const QString& amount,const QString& justification,const QString& expensetype)
{
    opendb();
    QSqlQuery query;
    QString querystr="INSERT INTO cashtrn (trndate,trntype,amount,justification,trncategory) VALUES (date('now'),2,"+amount+",'"\
            +justification+"',"+expensetype+")";
    query.exec(querystr);
    qDebug()<<querystr;

}

QString sqlquerymodel::getSumIncome()
{
    opendb();
    QSqlQuery query;
    QString querystr="SELECT sum(amount) from cashtrn where trntype=1";
    query.exec(querystr);
    query.next();
    QString income=query.value(0).toString();
    qDebug()<<querystr;
    return income;


}

QString sqlquerymodel::getSumExpenses()
{
    opendb();
    QSqlQuery query;
    QString querystr="SELECT sum(amount) from cashtrn where trntype=2";
    query.exec(querystr);
    query.next();
    QString expenses=query.value(0).toString();
    qDebug()<<querystr;
    return expenses;


}



void sqlquerymodel::updateCashtrnField(const QString& cashtrnid,const QString& fieldname,const QString& value)
{
    QSqlQuery query;
    QString querystr="UPDATE cashtrn set "+fieldname+"="+value+" where id="+cashtrnid;
    query.exec(querystr);
    qDebug()<<querystr;

}

void sqlquerymodel::insert_customer(Customer *customer)
{

    QSqlQuery query;
    QString querystr="select max(id) from customer";
    query.exec(querystr);
    query.next();
    QVariant maxid=query.value(0).toInt()+1;

    querystr="INSERT INTO customer (name,title,address,district,city,afm,occupation,tel1,tel2,fax,email,comments,doyid,\
            vatstatusid,routeid,erpupd,id,erpid) VALUES('"\
            +customer->name()+"','"+customer->title()+"','"+customer->address()+"','"+customer->district()+"','"+customer->city()+"','"\
            +customer->afm()+"','"+customer->occupation()+"','"+customer->tel1()+"','"+customer->tel2()+"','"+customer->fax()+"','"\
            +customer->email()+"','"+customer->comments()+"','"+customer->doyid()+"','"+customer->vatstatusid()+"','"\
            +customer->routeid()+"',0,"+maxid.toString()+","+maxid.toString()+")";
    query.exec(querystr);
    qDebug()<<querystr;

}

QList<QObject*> sqlquerymodel::getDoyList()
{
    opendb();
    QSqlQuery query;
    QString querystr="select d.erpid,d.description from doy d order by d.description";
    qDebug()<<querystr;
    query.exec(querystr);
    QList <QObject*> doys;
    while(query.next())
    {
        Doy* doy=new Doy();
        doy->setErpid(query.value(0).toString());
        doy->setDescription(query.value(1).toString());
        doys.append(doy);
    }
    return doys;

}

QList<QObject*> sqlquerymodel::getVatStatusList()
{
    opendb();
    QSqlQuery query;
    QString querystr="select v.codeid,v.description,v.vatcodeid from vatstatus v order by v.codeid";
    qDebug()<<querystr;
    query.exec(querystr);
    QList <QObject*> vatstatuses;
    while(query.next())
    {
        vatstatus* vs=new vatstatus();
        vs->setCodeid(query.value(0).toString());
        vs->setDescription(query.value(1).toString());
        vs->setVatcodeid(query.value(2).toString());
        vatstatuses.append(vs);
    }
    return vatstatuses;

}

QString sqlquerymodel::getDoybyDescription(QString doy)
{
    QSqlQuery query;
    QString querystr="select erpid from doy where description='"+doy+"'";
    query.exec(querystr);
    query.next();
    return query.value(0).toString();


}

QString sqlquerymodel::getVatStatusbyDescription(QString vatstatus)
{
    QSqlQuery query;
    QString querystr="select codeid from vatstatus where description='"+vatstatus+"'";
    qDebug()<<querystr;
    query.exec(querystr);
    query.next();
    return query.value(0).toString();

}

float sqlquerymodel::getVatPercent(QString vatid,QString vatstatusid)
{
    QSqlQuery query;
    QString querystr;
    if(vatstatusid=="0")
           querystr="select percent0 from vat where codeid="+vatid;
        else
           querystr="select percent1 from vat where codeid="+vatid;

    query.exec(querystr);
    qDebug()<<querystr;
    query.next();
    return query.value(0).toFloat();

}

QStringList sqlquerymodel::getcompanydata()
{
    QSqlQuery query;
    QString querystr="select name,occupation,address,city,afm,doy,tel1,tel2,email,site from companydata";
    query.exec(querystr);
    query.next();
    QStringList companydata;
    companydata<<query.value(0).toString()<<query.value(1).toString()<<query.value(2).toString()\
              <<query.value(3).toString()<<query.value(4).toString()<<query.value(5).toString()\
             <<query.value(6).toString()<<query.value(7).toString()<<query.value(8).toString()<<query.value(9).toString();
    return companydata;
}

QString sqlquerymodel::getsalesmanid()
{
    QSqlQuery query;
    QString querystr="select salesmanid from tabletinfo";
    query.exec(querystr);
    query.next();
    return query.value(0).toString();


}

bool sqlquerymodel::check_afm(QString afm)
{
    QSqlQuery query;
    QString querystr="select name from customer where afm='"+afm+"'";
    query.exec(querystr);
    if(query.next())
        return true;
    else
        return false;
}

