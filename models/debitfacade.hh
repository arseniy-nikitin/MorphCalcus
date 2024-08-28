#pragma once

#include <QObject>

#include "debitmodel.hh"

using DebitModel::DebitType;
using DebitModel::DebitType::Capitalization;
using DebitModel::DebitType::Payment;
using DebitModel::RefreshRate;
using DebitModel::RefreshRate::Once;
using DebitModel::RefreshRate::Month;
using DebitModel::RefreshRate::Quartal;
using DebitModel::RefreshRate::Half;
using DebitModel::RefreshRate::Year;

class DebitFacade : public QObject
{
    Q_OBJECT
public:
    explicit DebitFacade(QObject *parent = nullptr) : QObject(parent),
        m_debitModel(new DebitModel(this)) {}

    void updateAmount(const QString input) {
        QString actualAmount {QString.number(m_debitModel->amount())};
        QString newAmount {actualAmount + input};
        if (newAmount.length() <= 12) {
            bool ok {true};
            qreal value {newAmount.toDouble(&ok)};
            // POTENTIALLY CAN BROKE EVERYTHING !!!
            // Process wrong inputs such as multiple dots
            // checking dots manually can be better solution
            ok {QString::number(value) == newAmount ? true : false};
            if (ok) {
                m_debitModel->setAmount(value);
                // emit amountChanged;
            }
        }
    }

    void updateInterestRate(const QString input) {
        QString actualInterestRate {QString.number(m_debitModel->interestRate())};
        QString newInterestRate {actualInterestRate + input};
        if (newInterestRate.length() <= 3) {
            bool ok {true};
            qreal value {newInterestRate.toDouble(&ok)};
            // POTENTIALLY CAN BROKE EVERYTHING !!!
            // Process wrong inputs such as multiple dots
            // checking dots manually can be better solution
            ok {QString::number(value) == newInterestRate ? true : false};
            if (ok && value <= 100) {
                m_debitModel->setInterestRate(value);
                // emit interestRateChanged;
            }
        }
    }

    void updateTaxRate(const QString input) {
        QString actualTaxRate {QString.number(m_debitModel->taxRate())};
        QString newTaxRate {actualTaxRate + input};
        if (newTaxRate.length() <= 3) {
            bool ok {true};
            qreal value {newTaxRate.toDouble(&ok)};
            // POTENTIALLY CAN BROKE EVERYTHING !!!
            // Process wrong inputs such as multiple dots
            // checking dots manually can be better solution
            ok {QString::number(value) == newTaxRate ? true : false};
            if (ok && value <= 100) {
                m_debitModel->setTaxRate(value);
                // emit taxRateChanged;
            }
        }
    }

    // Hz che s etim delat'
    void updateStartDate(const QDate input);

    void updatePeriodInMonth(const QString input) {
        QString actualPeriodInMonth {QString.number(m_debitModel->periodInMonth())};
        QString newPeriodInMonth {actualPeriodInMonth + input};
        if (newPeriodInMonth.length() <= 4) {
            bool ok {true};
            qreal value {newPeriodInMonth.toDouble(&ok)};
            // POTENTIALLY CAN BROKE EVERYTHING !!!
            // Process wrong inputs such as multiple dots
            // checking dots manually can be better solution
            ok {QString::number(value) == newPeriodInMonth ? true : false};
            if (ok && value <= 1200) {
                m_debitModel->setPeriodInMonth(value);
                // emit periodInMonthChanged;
            }
        }
    }

    void changeType() {
        DebitType actualType {m_debitModel->type()};
        if (actualType == Capitalization) {
            m_debitModel->setType(Payment);
        } else if (actualType == Payment) {
            m_debitModel->setType(Capitalization);
        }
        // emit typeChanged;
    }

    void changeRefreshRate() {
        RefreshRate actualRefreshRate {m_debitModel->refreshRate()};
        if (actualRefreshRate == Once) {
            m_debitModel->setType(Month);
        } else if (actualRefreshRate == Month) {
            m_debitModel->setType(Quartal);
        } else if (actualRefreshRate == Quartal) {
            m_debitModel->setType(Half);
        } else if (actualRefreshRate == Half) {
            m_debitModel->setType(Year);
        } else if (actualRefreshRate == Year) {
            m_debitModel->setType(Once);
        }
        // emit typeChanged;
    }

    qreal debitAmount() const { return m_debitAmount; }
    qreal debitInterestRate() const { return m_debitInterestRate; }
    qreal taxRate() const { return m_taxRate; }
    QDate startDate() const { return m_startDate; }
    qreal periodInMonth() const { return m_periodInMonth; }
    DebitType debitType() const { return m_debitType; }
    RefreshRate refreshRate() const { return m_refreshRate; }

    QString amount() const { return  QString.number(m_debitModel->amount()); }
    QString interestRate() const { return  QString.number(m_debitModel->interestRate()); }
    QString taxRate() const { return  QString.number(m_debitModel->taxRate()); }
    QString startDate() const { return m_startDate.toString("dd/MM/yyyy"); }
    QString periodInMonth() const { return  QString.number(m_debitModel->periodInMonth()); }
    QString type() const {
        DebitType actualType {m_debitModel->type()};
        QString output {};
        if (actualType == Capitalization) {
            output {"Capitalization"};
        } else if (actualType == Payment) {
            output {"Payment"};
        }
        return output;
    }
    QString refreshRate() const {
        RefreshRate actualRefreshRate {m_debitModel->refreshRate()};
        QString output {};
        if (actualRefreshRate == Once) {
            output {"Once"};
        } else if (actualRefreshRate == Month) {
            output {"Month"};
        } else if (actualRefreshRate == Quartal) {
            output {"Quartal"};
        } else if (actualRefreshRate == Half) {
            output {"Half"};
        } else if (actualRefreshRate == Year) {
            output {"Year"};
        }
        return output;
    }


    // QList transactionsList() const { return m_transactions; }
    // void updateTransactions(QList transactions);

    // Outputs
    QString totalInterest() const {
        QString totalInterest {QString.number(m_debitModel->totalInterest())};
        if (totalInterest.length() > 12) {
            totalInterest {QString.number(m_debitModel->totalInterest(), 'e', 8)};
        }
        return totalInterest;
    }

    QString totalTax() const {
        QString totalTax {QString.number(m_debitModel->totalTax())};
        if (totalTax.length() > 12) {
            totalTax {QString.number(m_debitModel->totalTax(), 'e', 8)};
        }
        return totalTax;
    }

    QString totalBalance() const {
        QString totalBalance {QString.number(m_debitModel->totalBalance())};
        if (totalBalance.length() > 12) {
            totalBalance {QString.number(m_debitModel->totalBalance(), 'e', 8)};
        }
        return totalBalance;
    }

private slots:
    void updateOutputs() {
        m_debitModel->calculateOutputs();
        // emit outputsChanged
    }

private:
    DebitModel *m_debitModel;
};
