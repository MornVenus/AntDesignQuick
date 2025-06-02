import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Controls.impl

Button {
    id: control
    property string type: "default"
    property var attrs: []

    property color foreground: 'black'
    property color hForeground: foreground

    property color nColor: 'white'
    property color hColor: nColor
    property color pColor: hColor

    property color nBColor: 'white'
    property color hBColor: nBColor
    property color pBColor: hBColor

    property int bWidth: 1

    property int fontSize: 14

    property real hOpacity: 1

    property int radius: 8

    // ---------------------

    leftPadding: 15
    rightPadding: 15
    height: 32

    // ---------------------

    background: Rectangle {
        border.width: parent.bWidth
        color: !parent.enabled ? '#f5f5f5' : parent.pressed || parent.checked ? parent.pColor : parent.hovered ? parent.hColor : parent.nColor
        border.color: !parent.enabled ? '#d9d9d9' : parent.pressed || parent.checked ? parent.pBColor : parent.hovered ? parent.hBColor : parent.nBColor
        radius: parent.radius
        opacity: parent.hovered ? parent.hOpacity : 1

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            // 不拦截点击事件
            propagateComposedEvents: true
        }
    }

    contentItem: IconLabel {
        id: ic
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        text: control.text
        font: control.font
        color: !control.enabled ? 'gray' : control.hovered ? control.hForeground : control.foreground
        icon {
            source: control.icon.source
            width: control.icon.width
            height: control.icon.height
            color: !control.enabled ? 'gray' : control.hovered ? control.hForeground : control.foreground
        }
    }

    //     Text {
    //         text: control.text
    //         visible: control.text
    //         color: control.hovered ? control.hForeground : control.foreground
    //         horizontalAlignment: Text.AlignHCenter
    //         verticalAlignment: Text.AlignVCenter
    //         font.pixelSize: control.fontSize
    //         smooth: true
    //         font.family: "SFMono-Regular"
    //     }

    // ---------------------

    Component.onCompleted: {
        switchType()
    }

    // ---------------------

    function switchType() {
        if (type == "default") {
            nBColor = "#d9d9d9"
            hBColor = "#4096ff"

            foreground = "#e0000000"
            hForeground = "#4096ff"

        } else if (type == "primary") {
            nColor = "#1677ff"
            hColor = "#4096ff"
            pColor = "#0958d9"
            bWidth = 0

            foreground = "white"
        } else if (type == "text") {
            hColor = "#f5f5f5"
            pColor = "#d9d9d9"
        } else if (type == "link") {
            foreground = "#1677ff"
            hForeground = "#a01677ff"
        } else if (type == "original") {
            nBColor = "#d0d0d0"
            hBColor = "#0078d4"

            hColor = "#e0eef9"
            pColor = "#cce4f7"

            radius = 4
            height = 30
        }
    }
}
