#pragma once

#include <QObject>
#include <QString>

class CalculatorModel : public QObject
{
    Q_OBJECT

public:
    explicit CalculatorModel(QObject *parent = nullptr);

    // Inputs
    void setEquation(const QString& equation);
    const QString& equation() const { return equation; }

    // Outputs
    void setResult(const QString& result);
    const QString& result() const { return result; }

private:
    // Inputs
    QString equation;

    // Outputs
    QString result;
};
