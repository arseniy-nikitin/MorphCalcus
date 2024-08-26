#pragma once

#include <QObject>

class CreditModel : public QObject
{
    Q_OBJECT

public:
    enum CreditType {
        Differentiated,
        Annuity
    };
    Q_ENUM(CreditType)

    explicit CreditModel(QObject *parent = nullptr);

    // Inputs
    void setAmount(const qreal amount);
    void setInterestRate(const qreal interestRate);
    void setPeriodInMonth(const qreal periodInMonth);
    void setType(CreditType type);

    qreal amount() const { return m_amount; }
    qreal interestRate() const { return m_interestRate; }
    qreal periodInMonth() const { return m_periodInMonth; }
    CreditType type() const { return m_type; }

    // Outputs
    void calculateOutputs();

    qreal firstPayment() const { return m_firstPayment; }
    qreal lastPayment() const { return m_lastPayment; }
    qreal overpayment() const { return m_overpayment; }
    qreal totalPayment() const { return m_totalPayment; }

private:
    // Inputs
    qreal m_amount;
    qreal m_interestRate;
    qreal m_periodInMonth;
    CreditType m_type;

    // Outputs
    qreal m_firstPayment;
    qreal m_lastPayment;
    qreal m_overpayment;
    qreal m_totalPayment;
};
