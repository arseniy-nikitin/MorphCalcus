#pragma once

#include <QObject>
#include <QString>

class CalculatorModel : public QObject
{
    Q_OBJECT

public:
    explicit CalculatorModel(QObject *parent = nullptr);

    // Inputs
    const QString& equation() const { return equation; }
    void setEquation(const QString& equation);

    // Outputs
    const QString& result() const { return result; }
    void setResult(const QString& result);

private:
    // Inputs
    QString equation;

    // Outputs
    QString result;
};
