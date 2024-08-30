#pragma once

#include <QObject>

namespace Morph {

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
    qreal amount() const { return m_amount; }
    qreal interestRate() const { return m_interestRate; }
    qreal periodInMonth() const { return m_periodInMonth; }
    CreditType type() const { return m_type; }

    void setAmount(const qreal amount) { m_amount = amount; }
    void setInterestRate(const qreal interestRate) { m_interestRate = interestRate; }
    void setPeriodInMonth(const qreal periodInMonth) { m_periodInMonth = periodInMonth; }
    void setType(CreditType type) { m_type = type; }

    // Outputs
    qreal firstPayment() const { return m_firstPayment; }
    qreal lastPayment() const { return m_lastPayment; }
    qreal overpayment() const { return m_overpayment; }
    qreal totalPayment() const { return m_totalPayment; }

    void calculateDifferentiated();
    void calculateAnnuity();

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

} // namespace Morph
