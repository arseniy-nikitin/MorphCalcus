#include "models/input_field/input_field.hh"

#include <QRegularExpression>

namespace Morph::Models {

void IntegerInputField::append(const QString& input) {
    value.append(input);
}

bool IntegerInputField::isValid() const {
    QRegularExpression intRegex("^-?\\d+$");
    return intRegex.match(value).hasMatch();
}

QString IntegerInputField::getValue() const {
    return value;
}

} // namespace Morph::Models
