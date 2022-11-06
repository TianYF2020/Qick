import QtQuick 2.0

Rectangle
{
    id:borderRect
    property int boardTopWidth: 0
    property int boardBottomWidth: 0
    property int boardLeftWidth: 0
    property int boardRightWidth: 0
    //    width: 200
//    height: 100
    color:"black"

    Rectangle
    {
        color: "white"
        anchors.fill: parent
        anchors.topMargin: boardTopWidth
        anchors.bottomMargin: boardBottomWidth
        anchors.leftMargin: boardLeftWidth
        anchors.rightMargin: boardRightWidth
    }
}
