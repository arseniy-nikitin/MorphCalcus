#pragma once

#include <QObject>

#include "creditmodel.hh"

using CreditModel::CreditType;
using CreditModel::CreditType::Differentiated;
using CreditModel::CreditType::Annuity;

class creditfacade : public QObject
{
    Q_OBJECT
public:
    explicit creditfacade(QObject *parent = nullptr) : QObject(parent),
        m_creditModel(new CreditModel(this)) {}

    void updateAmount(const QString input) {
        QString actualAmount = QString.number(m_creditModel->amount());
        QString newAmount = actualAmount + input;
        if (newAmount.length() <= 12) {
            bool ok = true;
            qreal value = newAmount.toDouble(&ok);
            // POTENTIALLY CAN BROKE EVERYTHING !!!
            // Process wrong inputs such as multiple dots
            // checking dots manually can be better solution
            ok = QString::number(value) == newAmount ? true : false;
            if (ok) {
                m_creditModel->setAmount(value);
                // emit amountChanged;
            }
        }
    }

    void updateInterestRate(const QString input) {
        QString actualInterestRate = QString.number(m_creditModel->interestRate());
        QString newInterestRate = actualInterestRate + input;
        if (newInterestRate.length() <= 3) {
            bool ok = true;
            qreal value = newInterestRate.toDouble(&ok);
            // POTENTIALLY CAN BROKE EVERYTHING !!!
            // Process wrong inputs such as multiple dots
            // checking dots manually can be better solution
            ok = QString::number(value) == newInterestRate ? true : false;
            if (ok && value <= 100) {
                m_creditModel->setInterestRate(value);
                // emit interestRateChanged;
            }
        }
    }

    void updatePeriodInMonth(const QString input) {
        QString actualPeriodInMonth = QString.number(m_creditModel->periodInMonth());
        QString newPeriodInMonth = actualPeriodInMonth + input;
        if (newPeriodInMonth.length() <= 4) {
            bool ok = true;
            qreal value = newPeriodInMonth.toDouble(&ok);
            // POTENTIALLY CAN BROKE EVERYTHING !!!
            // Process wrong inputs such as multiple dots
            // checking dots manually can be better solution
            ok = QString::number(value) == newPeriodInMonth ? true : false;
            if (ok && value <= 1200) {
                m_creditModel->setPeriodInMonth(value);
                // emit periodInMonthChanged;
            }
        }
    }

    void changeType() {
        CreditType actualType = m_creditModel->CreditType();
        switch(actualType) {
            case Differentiated:
                m_creditModel->setType(Annuity);
                break;
            case Annuity:
                m_creditModel->setType(Differentiated);
                break;
        }
        // emit typeChanged;
    }


    QString amount() const { return  QString.number(m_creditModel->amount()); }
    QString interestRate() const { return  QString.number(m_creditModel->interestRate()); }
    QString periodInMonth() const { return  QString.number(m_creditModel->periodInMonth()); }
    QString type() const {
        CreditType actualType = m_creditModel->CreditType();
        switch(actualType) {
            case Differentiated:
                return "Differentiated";
                break;
            case Annuity:
                return "Annuity";
                break;
        }
    }

    // Outputs
    QString firstPayment() const {
        QString firstPayment = QString.number(m_creditModel->firstPayment());
        if (firstPayment.length() > 12) {
            firstPayment = QString.number(m_creditModel->firstPayment(), 'e', 8);
        }
        return firstPayment;
    }

    QString lastPayment() const {
        QString lastPayment = QString.number(m_creditModel->lastPayment());
        if (lastPayment.length() > 12) {
            lastPayment = QString.number(m_creditModel->lastPayment(), 'e', 8);
        }
        return lastPayment;
    }

    QString overpayment() const {
        QString overpayment = QString.number(m_creditModel->overpayment());
        if (overpayment.length() > 12) {
            overpayment = QString.number(m_creditModel->overpayment(), 'e', 8);
        }
        return overpayment;
    }

    QString totalPayment() const {
        QString totalPayment = QString.number(m_creditModel->totalPayment());
        if (totalPayment.length() > 12) {
            totalPayment = QString.number(m_creditModel->totalPayment(), 'e', 8);
        }
        return totalPayment;
    }

private slots:
    void updateOutputs() {
        m_creditModel->calculateOutputs();
        // emit outputsChanged
    }

private:
    CreditModel *m_creditModel;
};
