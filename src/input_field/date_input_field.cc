#include "models/input_field/input_field.hh"

#include <QRegularExpression>

namespace Morph::Models {

void DateInputField::append(const QString& input) {
    value.append(input);
}

bool DateInputField::isValid() const {
    QRegularExpression intRegex("^\\d{4}-\\d{2}-\\d{2}$");
    return intRegex.match(value).hasMatch();
}

QString DateInputField::getValue() const {
    return value;
}

} // namespace Morph::Models
