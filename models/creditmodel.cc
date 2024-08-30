#include "creditmodel.hh"

namespace Morph {

CreditModel::CreditModel(QObject *parent)
    : QObject(parent),
    m_amount(0),
    m_interestRate(0),
    m_periodInMonth(0),
    m_type(Differentiated),
    m_firstPayment(0),
    m_lastPayment(0),
    m_overpayment(0),
    m_totalPayment(0)
{
}

void CreditModel::calculateDifferentiated() {

}

void CreditModel::calculateAnnuity() {

}

} // namespace Morph
