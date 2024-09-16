#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.addImportPath(":/arseniy.nikitin/imports");
    engine.load(QUrl(u"qrc:/arseniy.nikitin/imports/Morph/qml/main.qml"_qs));

    return app.exec();
}
