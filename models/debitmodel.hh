#pragma once

#include <QObject>
#include <QString>
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

    enum TransactionType {
        CashIn,
        CashOut
    };
    Q_ENUM(TransactionType)

    struct Transaction {
        QString transactionAmount;
        QDate startDate;
        QString transactionRate;
        TransactionType transactionType;
    };

    explicit DebitModel(QObject *parent = nullptr);

    // Inputs
    QString debitAmount() const { return m_debitAmount; }
    void setDebitAmount(const QString debitAmount);
    QString debitInterestRate() const { return m_debitInterestRate; }
    void setDebitInterestRate(const QString debitInterestRate);
    QString taxRate() const { return m_taxRate; }
    void setTaxRate(const QString taxRate);
    QDate startDate() const { return m_startDate; }
    void setStartDate(const QDate startDate);
    QString periodInMonth() const { return m_periodInMonth; }
    void setPeriodInMonth(const QString periodInMonth);
    DebitType debitType() const { return m_debitType; }
    void setDebitType(DebitType debitType);
    RefreshRate balanceRefreshRate() const { return m_balanceRefreshRate; }
    void setDebitType(RefreshRate balanceRefreshRate);

    // QList transactionsList() const { return m_transactions; }
    // void setTransactions(QList transactions);

    // Outputs
    QString totalInterest() const { return m_totalInterest; }
    void setTotalInterest(const QString totalInterest);
    QString totalTax() const { return m_totalTax; }
    void setTotalTax(const QString totalTax);
    QString totalBalance() const { return m_totalBalance; }
    void setTotalBalance(const QString totalBalance);

public slots:
    void debitDataChanged();

private:
    // Inputs
    QString m_debitAmount;
    QString m_debitInterestRate;
    QString m_taxRate;
    QDate m_startDate;
    QString m_periodInMonth;
    DebitType m_debitType;
    RefreshRate m_balanceRefreshRate;
    // QList transactionsList;

    // Outputs
    QString m_totalInterest;
    QString m_totalTax;
    QString m_totalBalance;
};
