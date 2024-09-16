#pragma once

#include <QString>

namespace Morph {

class DateString
{
public:
    void setDate(QString input) { m_date = input; }
    QString date() { return m_date; }

private:
    static quint8 m_pos;
    QString m_date;
};

} // Morph namespace
