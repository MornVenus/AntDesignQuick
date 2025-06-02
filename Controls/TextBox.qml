import QtQuick
import QtQuick.Controls.Fusion

TextField {

    property color nColor: 'white'
    property color hColor: nColor

    property color nBColor: '#e4e7ed'
    property color hBColor: '#4096ff'

    property int bWidth: 1
    property real hOpacity: 1

    property int radius: 8

    leftPadding: 10
    rightPadding: 10

    background: Rectangle {
        border.width: parent.bWidth
        color: !parent.enabled ? '#f5f5f5' : parent.hovered ? parent.hColor : parent.nColor
        border.color: !parent.enabled ? '#d9d9d9' : parent.activeFocus | parent.hovered ? parent.hBColor : parent.nBColor
        radius: parent.radius
        opacity: parent.hovered ? parent.hOpacity : 1
    }

    function test(){

    }
}
