#pragma once

#include <QObject>
#include <QString>

namespace Morph {

class CalculatorModel : public QObject
{
    Q_OBJECT

public:
    explicit CalculatorModel(QObject *parent = nullptr);

    const QString& equation() const { return m_equation; }
    void setEquation(const QString& equation) { m_equation = equation; }

    const QString& result() const { return m_result; }
    void calculateResult();

private:
    QString m_equation;

    QString m_result;
};

} // namespace Morph
