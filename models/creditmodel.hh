#pragma once

#include <QObject>
#include <QString>

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
    const QString& amount() const { return m_amount; }
    const QString& interestRate() const { return m_interestRate; }
    const QString& periodInMonth() const { return m_periodInMonth; }
    CreditType type() const { return m_type; }

    void setAmount(const QString& amount);
    void setInterestRate(const QString& interestRate);
    void setPeriodInMonth(const QString& periodInMonth);
    void setType(CreditType type);

    // Outputs
    const QString& firstPayment() const { return m_firstPayment; }
    const QString& lastPayment() const { return m_lastPayment; }
    const QString& overpayment() const { return m_overpayment; }
    const QString& totalPayment() const { return m_totalPayment; }

public slots:
    void updateOutputs();

private:
    // Inputs
    QString m_amount;
    QString m_interestRate;
    QString m_periodInMonth;
    CreditType m_type;

    // Outputs
    QString m_firstPayment;
    QString m_lastPayment;
    QString m_overpayment;
    QString m_totalPayment;
};
