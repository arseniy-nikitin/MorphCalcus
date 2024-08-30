#pragma once

#include <QObject>
#include <QString>
#include "creditmodel.hh"

namespace Morph {

using CreditModel::CreditType;

class CreditFacade : public QObject
{
    Q_OBJECT

signals:
    void amountChanged();
    void interestRateChanged();
    void periodInMonthChanged();
    void typeChanged();
    void outputsChanged();

public:
    explicit CreditFacade(QObject *parent = nullptr);

    QString amount() const;
    QString interestRate() const;
    QString periodInMonth() const;
    QString type() const;

    void updateAmount(const QString input);
    void updateInterestRate(const QString input);
    void updatePeriodInMonth(const QString input);
    void changeType();

    QString firstPayment() const;
    QString lastPayment() const;
    QString overpayment() const;
    QString totalPayment() const;

public slots:
    void updateOutputs();

private:
    CreditModel *m_creditModel;
};

} // namespace Morph
