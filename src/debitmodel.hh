#pragma once

#include <QObject>
#include <QDate>
#include <QList>

namespace Morph {

class DebitModel : public QObject
{
    Q_OBJECT

public:
    enum DebitType {
        Capitalization,
        Payment
    };
    Q_ENUM(DebitType)

    enum RefreshRate {
        Once,
        Month,
        Quartal,
        Half,
        Year
    };
    Q_ENUM(RefreshRate)

    explicit DebitModel(QObject *parent = nullptr);

    qreal amount() const { return m_amount; }
    qreal interestRate() const { return m_interestRate; }
    qreal taxRate() const { return m_taxRate; }
    QDate startDate() const { return m_startDate; }
    qreal periodInMonth() const { return m_periodInMonth; }
    DebitType type() const { return m_type; }
    RefreshRate refreshRate() const { return m_refreshRate; }
    // QList transactionsList() const { return m_transactions; }
    void setAmount(const qreal amount);
    void setInterestRate(const qreal interestRate);
    void setTaxRate(const qreal taxRate);
    void setStartDate(const QDate startDate);
    void setPeriodInMonth(const qreal periodInMonth);
    void setType(DebitType type);
    void setRefreshRate(RefreshRate refreshRate);
    // void setTransactionList(QList transactions);

    void calculateWithCapitalization();
    void calculateWithPayment();
    qreal totalInterest() const { return m_totalInterest; }
    qreal totalTax() const { return m_totalTax; }
    qreal totalBalance() const { return m_totalBalance; }

private:
    // Inputs
    qreal m_amount;
    qreal m_interestRate;
    qreal m_taxRate;
    QDate m_startDate;
    qreal m_periodInMonth;
    DebitType m_type;
    RefreshRate m_refreshRate;
    // QList transactionsList;

    // Outputs
    qreal m_totalInterest;
    qreal m_totalTax;
    qreal m_totalBalance;
};

} // namespace Morph
