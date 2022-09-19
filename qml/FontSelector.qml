import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import com.canapos.FontFunctions

Item {
    id: fontSelector
    height: 250
    width: 500

    property alias preview: previewText

    property string family: 'Impact'
    property int pointSize: 12
    property bool italic: false
    property bool bold: false

    signal selectClicked()
    signal cancelClicked()

    FontFunctions {
        id: fontDatabase

        property variant cache: fontDatabase.fonts()
    }

    Component.onCompleted: {
        for( let a=0; a < fontDatabase.cache.length; a++ )
        {
            const ent = fontDatabase.cache[a];
            if( ent['family'] === fontSelector.family )
            {
                fontListView.positionViewAtIndex(a, ListView.Center);
                break;
            }
        }
    }

    Pane {
        id: previewPane
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
            margins: 5
        }

        height: previewText.height + 20

        TextField {
            id: previewText
            //x: 5
            //y: 5
            width: parent.width
            height: contentHeight + 10

            font.family: fontSelector.family
            font.pointSize: fontSelector.pointSize
            font.bold: fontSelector.bold
            font.italic: fontSelector.italic
            text: 'The quick brown fox jumped over 15 lazy dogs!'
        }
    }

    ListView {
        id: fontListView
        clip: true
        model: fontDatabase.cache
        delegate: Button {
            flat: true
            width: fontListView.width
            contentItem: Label {
                anchors.fill: parent
                anchors.margins: 5
                verticalAlignment: Text.AlignVCenter
                text: modelData.family
                font.family: modelData.family
                elide: Text.ElideRight
            }
            highlighted: fontSelector.family === modelData.family
            onClicked: fontSelector.family = modelData.family
        }

        anchors {
            left: parent.left
            top: previewPane.bottom
            bottom: parent.bottom
            margins: 10
        }

        width: parent.width * 0.33
    }

    ListView {
        id: fontSizeView
        clip: true
        model: fontDatabase.cache[ fontListView.currentIndex ]['standardSizes']
        onModelChanged: {
            for( let a=0; a < model.length; a++ )
            {
                const ent = model[a];
                if( ent === fontSelector.pointSize )
                {
                    fontSizeView.positionViewAtIndex(a, ListView.Center);
                    break;
                }
            }
        }

        delegate: Button {
            flat: true
            width: fontSizeView.width
            contentItem: Label {
                anchors.fill: parent
                anchors.margins: 5
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: modelData
                elide: Text.ElideRight
            }
            highlighted: fontSelector.pointSize === modelData
            onClicked: fontSelector.pointSize = modelData
        }

        anchors {
            right: parent.right
            top: previewPane.bottom
            bottom: parent.bottom
            margins: 10
        }
        width: 50
    }

    Column {
        anchors {
            left: fontListView.right
            right: fontSizeView.left
            top: previewPane.bottom
            bottom: parent.bottom
            margins: 5
        }

        CheckBox {
            text: qsTr('Bold')
            checked: fontSelector.bold
            onClicked: fontSelector.bold = checked
        }
        CheckBox {
            text: qsTr('Italic')
            checked: fontSelector.italic
            onClicked: fontSelector.italic = checked
        }
    }

    Row {
        id: buttonBar
        anchors {
            left: fontListView.right
            right: fontSizeView.left
            bottom: parent.bottom
            margins: 5
        }
        spacing: 5

        Button {
            text: qsTr('Select')
            onClicked: fontSelector.selectClicked();
        }

        Button {
            text: qsTr('Cancel')
            onClicked: fontSelector.cancelClicked();
        }
    }
}
