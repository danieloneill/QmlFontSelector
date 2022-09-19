#ifndef FONTSELECTOR_H
#define FONTSELECTOR_H

#include <QQuickItem>

class FontFunctions : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(FontFunctions)

    QVariantList m_fonts;

public:
    explicit FontFunctions(QQuickItem *parent = nullptr);
    ~FontFunctions() override;

    Q_INVOKABLE const QVariant fonts() const;
};

#endif // FONTSELECTOR_H
