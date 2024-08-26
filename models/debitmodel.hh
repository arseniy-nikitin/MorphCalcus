#pragma once

#include <QObject>
#include <qreal>
#include <QDate>
#include <QList>

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

    // Inputs
    void setDebitAmount(const qreal debitAmount);
    void setDebitInterestRate(const qreal debitInterestRate);
    void setTaxRate(const qreal taxRate);
    void setStartDate(const QDate startDate);
    void setPeriodInMonth(const qreal periodInMonth);
    void setDebitType(DebitType debitType);
    void setBalanceRefreshRate(RefreshRate balanceRefreshRate);

    qreal debitAmount() const { return m_debitAmount; }
    qreal debitInterestRate() const { return m_debitInterestRate; }
    qreal taxRate() const { return m_taxRate; }
    QDate startDate() const { return m_startDate; }
    qreal periodInMonth() const { return m_periodInMonth; }
    DebitType debitType() const { return m_debitType; }
    RefreshRate balanceRefreshRate() const { return m_balanceRefreshRate; }

    // QList transactionsList() const { return m_transactions; }
    // void setTransactions(QList transactions);

    // Outputs
    void setTotalInterest(const qreal totalInterest);
    void setTotalTax(const qreal totalTax);
    void setTotalBalance(const qreal totalBalance);

    qreal totalInterest() const { return m_totalInterest; }
    qreal totalTax() const { return m_totalTax; }
    qreal totalBalance() const { return m_totalBalance; }

public slots:
    void debitDataChanged();

private:
    // Inputs
    qreal m_debitAmount;
    qreal m_debitInterestRate;
    qreal m_taxRate;
    QDate m_startDate;
    qreal m_periodInMonth;
    DebitType m_debitType;
    RefreshRate m_balanceRefreshRate;
    // QList transactionsList;

    // Outputs
    qreal m_totalInterest;
    qreal m_totalTax;
    qreal m_totalBalance;
};
