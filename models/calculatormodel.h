
// Create CalculatorFacade that will call EquationModel and ResultModel methods

class CalculatorFacade : public QObject
{
public:
    void processInput(QString input) {
        if (input == "result") {
            resultModel->setResult(equationModel->equation());
        } else {
            equationModel->setEquation(input);
        }
    }

private:
    std::unique_ptr<EquationModel> equationModel;
    std::unique_ptr<ResultModel> resultModel;
};








#ifndef CALCULATORMODEL_H
#define CALCULATORMODEL_H

#include <QObject>

class CalculatorModel : public QObject
{

};

#endif // CALCULATORMODEL_H
