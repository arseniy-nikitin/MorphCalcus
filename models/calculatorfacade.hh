#pragma once

#include <QObject>

class calculatorfacade : public QObject
{
    Q_OBJECT
public:
    explicit calculatorfacade(QObject *parent = nullptr);

signals:
};
