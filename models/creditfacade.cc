#include "creditfacade.hh"

namespace Morph {

CreditFacade::CreditFacade(QObject *parent)
    : QObject(parent), m_creditModel(new CreditModel(this)) {
    // Connect signals to updateOutputs slot
    connect(this, &CreditFacade::amountChanged, this, &CreditFacade::updateOutputs);
    connect(this, &CreditFacade::interestRateChanged, this, &CreditFacade::updateOutputs);
    connect(this, &CreditFacade::periodInMonthChanged, this, &CreditFacade::updateOutputs);
    connect(this, &CreditFacade::typeChanged, this, &CreditFacade::updateOutputs);
}

QString CreditFacade::amount() const {
    return QString::number(m_creditModel->amount());
}

QString CreditFacade::interestRate() const {
    return QString::number(m_creditModel->interestRate());
}

QString CreditFacade::periodInMonth() const {
    return QString::number(m_creditModel->periodInMonth());
}

QString CreditFacade::type() const {
    CreditType actualType {m_creditModel->type()};
    QString output {};
    if (actualType == CreditType::Differentiated) {
        output = "Differentiated";
    } else if (actualType == CreditType::Annuity) {
        output = "Annuity";
    }
    return output;
}

void CreditFacade::updateAmount(const QString input) {
    QString actualAmount {QString::number(m_creditModel->amount())};
    QString newAmount {actualAmount + input};
    if (newAmount.length() <= 12) {
        bool ok {true};
        qreal value {newAmount.toDouble(&ok)};
        // POTENTIALLY CAN BROKE EVERYTHING !!!
        // Process wrong inputs such as multiple dots
        // checking dots manually can be better solution
        ok = QString::number(value) == newAmount ? true : false;
        if (ok) {
            m_creditModel->setAmount(value);
            emit amountChanged();
        }
    }
}

void CreditFacade::updateInterestRate(const QString input) {
    QString actualInterestRate {QString::number(m_creditModel->interestRate())};
    QString newInterestRate {actualInterestRate + input};
    if (newInterestRate.length() <= 3) {
        bool ok {true};
        qreal value {newInterestRate.toDouble(&ok)};
        // POTENTIALLY CAN BROKE EVERYTHING !!!
        // Process wrong inputs such as multiple dots
        // checking dots manually can be better solution
        ok = QString::number(value) == newInterestRate ? true : false;
        if (ok && value <= 100) {
            m_creditModel->setInterestRate(value);
            emit interestRateChanged();
        }
    }
}

void CreditFacade::updatePeriodInMonth(const QString input) {
    QString actualPeriodInMonth {QString::number(m_creditModel->periodInMonth())};
    QString newPeriodInMonth {actualPeriodInMonth + input};
    if (newPeriodInMonth.length() <= 4) {
        bool ok {true};
        qint32 value {newPeriodInMonth.toInt(&ok)};
        // POTENTIALLY CAN BROKE EVERYTHING !!!
        // Process wrong inputs such as multiple dots
        // checking dots manually can be better solution
        ok = QString::number(value) == newPeriodInMonth ? true : false;
        if (ok && value <= 1200) {
            m_creditModel->setPeriodInMonth(value);
            emit periodInMonthChanged();
        }
    }
}

void CreditFacade::changeType() {
    CreditType actualType {m_creditModel->type()};
    if (actualType == CreditType::Differentiated) {
        m_creditModel->setType(CreditType::Annuity);
    } else if (actualType == CreditType::Annuity) {
        m_creditModel->setType(CreditType::Differentiated);
    }
    emit typeChanged();
}

QString CreditFacade::firstPayment() const {
    QString firstPayment {QString::number(m_creditModel->firstPayment())};
    if (firstPayment.length() > 12) {
        firstPayment = QString::number(m_creditModel->firstPayment(), 'e', 8);
    }
    return firstPayment;
}

QString CreditFacade::lastPayment() const {
    QString lastPayment {QString::number(m_creditModel->lastPayment())};
    if (lastPayment.length() > 12) {
        lastPayment = QString::number(m_creditModel->lastPayment(), 'e', 8);
    }
    return lastPayment;
}

QString CreditFacade::overpayment() const {
    QString overpayment {QString::number(m_creditModel->overpayment())};
    if (overpayment.length() > 12) {
        overpayment = QString::number(m_creditModel->overpayment(), 'e', 8);
    }
    return overpayment;
}

QString CreditFacade::totalPayment() const {
    QString totalPayment {QString::number(m_creditModel->totalPayment())};
    if (totalPayment.length() > 12) {
        totalPayment = QString::number(m_creditModel->totalPayment(), 'e', 8);
    }
    return totalPayment;
}

void CreditFacade::updateOutputs() {
    //m_creditModel->calculateOutputs();
    emit outputsChanged();
}

} // namespace Morph
