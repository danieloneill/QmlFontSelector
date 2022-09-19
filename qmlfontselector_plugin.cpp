#include "qmlfontselector_plugin.h"

#include "fontselector.h"

#include <qqml.h>

void QmlFontSelectorPlugin::registerTypes(const char *uri)
{
    // @uri com.canapos.FontFunctions
    qmlRegisterType<FontFunctions>(uri, 1, 0, "FontFunctions");
}

