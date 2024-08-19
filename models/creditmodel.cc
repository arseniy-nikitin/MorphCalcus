#include "creditmodel.hh"

CreditModel::CreditModel(QObject *parent)
    : QObject(parent)
{
    connect(this, &CreditModel::amountChanged, this, &CreditModel::updateOutputs);
    connect(this, &CreditModel::interestRateChanged, this, &CreditModel::updateOutputs);
    connect(this, &CreditModel::periodInMonthChanged, this, &CreditModel::updateOutputs);
    connect(this, &CreditModel::typeChanged, this, &CreditModel::updateOutputs);
}

void CreditModel::setAmount(const QString amount)
{
    if (m_amount != amount) {
        m_amount = amount;
        emit amountChanged();
    }
}

void CreditModel::setInterestRate(const QString interestRate)
{
    if (m_interestRate != interestRate) {
        m_interestRate = interestRate;
        emit interestRateChanged();
    }
}

void CreditModel::setPeriodInMonth(const QString periodInMonth)
{
    if (m_periodInMonth != periodInMonth) {
        m_periodInMonth = periodInMonth;
        emit periodInMonthChanged();
    }
}

void CreditModel::setType(CreditType type)
{
    if (m_type != type) {
        m_type = type;
        emit typeChanged();
    }
}

void CreditModel::updateOutputs()
{
    // Implement the logic to update m_firstPayment, m_lastPayment, m_overpayment, and m_totalPayment
    // based on the current values of m_amount, m_interestRate, m_periodInMonth, and m_type.

    // Example (pseudo-code):
    // m_firstPayment = calculateFirstPayment(m_amount, m_interestRate, m_periodInMonth, m_type);
    // m_lastPayment = calculateLastPayment(m_amount, m_interestRate, m_periodInMonth, m_type);
    // m_overpayment = calculateOverpayment(m_amount, m_interestRate, m_periodInMonth, m_type);
    // m_totalPayment = calculateTotalPayment(m_amount, m_interestRate, m_periodInMonth, m_type);
}
