# QmlFontSelector
A font selector written in QML and C++ (Component) for Qt6

## Building
The component itself should be built from a shadow directory.

```
~/code/QmlFontSelector$ mkdir build
~/code/QmlFontSelector$ cd build
~/code/QmlFontSelector/build$ qmake ..
Info: creating stash file /home/user/code/QmlFontSelector/build/.qmake.stash
~/code/QmlFontSelector/build$ make -j4
....
~/code/QmlFontSelector/build$ sudo make install
```

## Trying
Once the component is installed, you can actually see the control itself by just loading it in the `qml` utility:

```
~/code/QmlFontSelector$ qml qml/FontSelector.qml
```

The result should look something like:

![Screenshot of FontSelector running in the qml utility](https://i.imgur.com/5OJQa6r.png)

## Embedding
The `FontSelector.qml` file in the qml directory is the actual control, and can be included from anywhere within (or without) your Qt Quick project as long as the component is installed.

It may be desired to compile the component into your C++/Qt Quick project, and it can be done by completing the following steps:

 * Add `fontselector.cpp` to your SOURCES
 * Add `fontselector.h` to your HEADERS
 * #include "fontselector.h" where your QQmlApplicationEngine is instantiated
 * Register the component with something akin to: `qmlRegisterType<FontFunctions>("com.canapos.FontFunctions", 1, 0, "FontFunctions");`
 
Now the FontSelector control should be able to instantiate and be used in your own code.
