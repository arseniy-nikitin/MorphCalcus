#pragma once

#include <QObject>

namespace Morph {

class TransactionModel : public QObject
{
    Q_OBJECT
public:
    explicit TransactionModel(QObject *parent = nullptr);

signals:
};

} // namespace Morph
