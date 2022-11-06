import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    //    property int myValue: 0
    //    signal mSignal()

    //    onWidthChanged:
    //    {
    //        console.log("width:",width);
    //    }

    //    onMyValueChanged:
    //    {
    //        console.log("width:",width);
    //    }

        Label
        {
            id:mlabel
            opacity: 0.5
            text: qsTr("test")
        }

        Button
        {
            id:btn
            text: "test"
            anchors.left:mlabel.right
            width: 100
            height: 50
            objectName: "bt112"
            background: Rectangle   //按键按下时候回外框回变色
            {
                border.color:btn.focus?"blue":"black"
            }
            Keys.onRightPressed: //
            {
                btn1.focus = true
            }

            onClicked:   // 打印当前项，对象object名字，调试时候使用
            {
                 console.log("width:",width);
                console.log("active focus item changed",activeFocusItem,activeFocusItem.objectName)
            }
        }


        Button
        {
            id:btn1
            text: "test"
            anchors.left:btn.right
            anchors.leftMargin: 100
            height: 50
            width: 100
            background: Rectangle
            {
                border.color:btn1.focus?"blue":"black"
            }
            onClicked:
            {
                 console.log("width:",width);
                console.log("active focus item changed",activeFocusItem,activeFocusItem.objectName)
            }
            Keys.onLeftPressed:
            {
                btn.focus = true
            }
        }


    //    onMy


    //    TableView
    //    {
    //        anchors.fill: parent
    ////        model: TableModel
    ////        {

    ////        }

    //        delegate: Rectangle
    //        {
    //            implicitWidth:100
    //            implicitHeight :20
    //            color:"black"
    //            border.color:"white"
    //            border.width:1
    //        }
    //    }
}
