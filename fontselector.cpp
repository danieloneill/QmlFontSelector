#include <QFontDatabase>

#include "fontselector.h"

FontFunctions::FontFunctions(QQuickItem *parent)
    : QQuickItem(parent)
{
    QVariantList results;

    QVariantList standardSizes;
    QList<int> standardInts = QFontDatabase::standardSizes();
    for( int size : standardInts )
    {
        standardSizes.append(size);
    }

    QStringList families = QFontDatabase::families();
    for( QString family : families )
    {
        QVariantList styles;
        QStringList styleStrings = QFontDatabase::styles(family);
        for( QString style : styleStrings )
        {
            QVariantList pointSizes;
            QList<int> pointInts = QFontDatabase::pointSizes(family, style);
            for( int size : pointInts )
            {
                pointSizes.append(size);
            }

            QVariantList smoothSizes;
            QList<int> smoothInts = QFontDatabase::smoothSizes(family, style);
            for( int size : smoothInts )
            {
                smoothSizes.append(size);
            }

            QVariantMap ent;
            ent["name"] = style;
            ent["pointSizes"] = pointSizes;
            ent["smoothSizes"] = smoothSizes;
            styles.append(ent);
        }

        QVariantMap entry;
        entry["family"] = family;
        entry["standardSizes"] = standardSizes;
        entry["styles"] = styles;

        results.append(entry);
    }

    m_fonts = results;
}

FontFunctions::~FontFunctions()
{
}

const QVariant FontFunctions::fonts() const
{
    return m_fonts;
}
