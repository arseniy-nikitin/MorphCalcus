#pragma once

#include <QObject>

namespace Morph {

class calculatorfacade : public QObject
{
    Q_OBJECT
public:
    explicit calculatorfacade(QObject *parent = nullptr);

signals:
};

} // namespace Morph
