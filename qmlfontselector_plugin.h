#ifndef QMLFONTSELECTOR_PLUGIN_H
#define QMLFONTSELECTOR_PLUGIN_H

#include <QQmlExtensionPlugin>

class QmlFontSelectorPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // QMLFONTSELECTOR_PLUGIN_H
