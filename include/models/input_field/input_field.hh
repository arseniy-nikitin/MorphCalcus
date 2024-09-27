#pragma once

#include <QObject>
#include <QString>

namespace Morph::Models {

class InputField : public QObject {
    Q_OBJECT
public:
    virtual void append(const QString& input) = 0;
    virtual bool isValid() const = 0;
    virtual QString getValue() const = 0;
    virtual ~InputField() = default;
};

class DateInputField final : public InputField {
    Q_OBJECT
public:
    DateInputField() : value("dd.mm.yyyy") {}
    void append(const QString& input);
    bool isValid() const;
    QString getValue() const;
private:
    QString value;
};

class IntegerInputField final : public InputField {
    Q_OBJECT
public:
    IntegerInputField() : value("") {}
    void append(const QString& input);
    bool isValid() const;
    QString getValue() const;
private:
    QString value;
};

} // namespace Morph::Models
