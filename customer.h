#ifndef CUSTOMER_H
#define CUSTOMER_H

#include <QObject>

class Customer : public QObject
{
    Q_OBJECT
public:
    explicit Customer(QObject *parent = 0);

signals:

public slots:

};

#endif // CUSTOMER_H
