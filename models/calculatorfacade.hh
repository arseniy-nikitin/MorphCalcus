#pragma once

#include <QObject>

#include "calculatormodel.hh"
#include "creditmodel.hh"
#include "debitmodel.hh"

class CalculatorFacade : public QObject
{
    Q_OBJECT

public:
    explicit CalculatorFacade(QObject *parent = nullptr) : QObject(parent),
        m_calculatorModel(new CalculatorModel(this)),
        m_creditModel(new CreditModel(this)),
        m_debitModel(new DebitModel(this)) {}

    // Calculator model
    const QString& calculatorEquation() const { return m_calculatorModel.equation(); }
    const QString& calculatorResult() const { return m_calculatorModel.result(); }

    void inputCalculatorEquation(const QString& input) { m_calculatorModel.setEquation(input); }

    // Credit model
    const QString& creditAmount() const { return m_creditModel.amount(); }
    const QString& creditInterestRate() const { return m_creditModel.interestRate(); }
    const QString& creditPeriodInMonth() const { return m_creditModel.periodInMonth(); }
    const QString& creditType() const { return m_creditModel.type(); }

    void inputCreditAmount(const QString& input) { m_creditModel.setAmount(input); }
    void inputCreditInterestRate(const QString& input) { m_creditModel.setInterestRate(input); }
    void inputCreditPeriodInMonth(const QString& input) { m_creditModel.setPeriodInMonth(input); }
    void inputCreditType(const QString& input) { m_creditModel.setCreditType(input); }

    const QString& firstPayment() const { return m_creditModel.firstPayment(); }
    const QString& lastPayment() const { return m_creditModel.lastPayment(); }
    const QString& overpayment() const { return m_creditModel.overpayment(); }
    const QString& totalPayment() const { return m_creditModel.totalPayment(); }


private:
    CalculatorModel *m_calculatorModel;
    CreditModel *m_creditModel;
    DebitModel *m_debitModel;
};
