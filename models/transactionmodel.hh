#pragma once

#include <QObject>

class TransactionModel : public QObject
{
    Q_OBJECT
public:
    explicit TransactionModel(QObject *parent = nullptr);

signals:
};
