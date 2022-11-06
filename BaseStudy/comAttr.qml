import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window
{
    width: 640
    height: 480
    title:"Atrr"
    visible: true
    color: "white"

    Rectangle
    {
        id:testRectangle
        x:100
        y:100
        //        anchors.fill: parent
        anchors.centerIn: parent  //横竖居中
        anchors.verticalCenter: parent.verticalCenter //居中
        anchors.horizontalCenter: parent.horizontalCenter //居中
        width: 100
        height: 100
        focus: true
        color: "black"
        MouseArea
        {
            anchors.fill: parent
            onClicked:   //点击区域可以出发
            {
                console.log("on clicked")
            }
        }
        Keys.onReturnPressed:  //回车触发打印，focus 要 true
        {
            console.log("on Enter")
        }
    }


    Button
    {

        anchors.left: testRectangle.right
        anchors.leftMargin:50
        text: "test"
    }

    Rectangle
    {
        color: "red"
        width: 100
        height: 100
        rotation: 30  //旋转
        scale: 0.5  // 缩放
        border.width: 5    //边框
        border.color: "black"
        radius: 90 //圆角弧度
    }

    Rectangle
    {
        anchors.verticalCenter: parent.verticalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 150
        width: 100
        height: 100

        gradient:Gradient  //颜色渐变
        {
            GradientStop  //颜色层次变化
            {
                position:0.0;color:"lightsteelblue"
            }
            GradientStop
            {
                position:1.0;color:"blue"
            }
        }

    }

    MyRectangle   //可自定义边框的矩形
    {
        x:300
        y:20
        z:2
        width: 100
        height: 50
        boardTopWidth:10
        boardBottomWidth: 5
        boardLeftWidth: 2
        boardRightWidth: 1
    }


    Rectangle   //自定义状态索引
    {
        id: changeState
        state: "nomal"
        x:300
        y:300
        width: 100
        height: 100
        z:4

        states:[
            State {
                name: "nomal"
                PropertyChanges {
                    target: changeState
                    color: "green";
                }
            },
            State
            {
                name: "red_color"
                PropertyChanges
                {
                    target: changeState;
                    color: "red";
                    width: 200;
                }
            },
            State
            {
                name:"blue_color"
                PropertyChanges
                {
                    target:changeState;
                    color: "blue";
                    height: 200;
                }
            }

        ]
        MouseArea
        {
            anchors.fill: parent
            onPressed:
            {
                changeState.state="red_color"
            }
            onReleased:
            {
                changeState.state="blue_color"
            }
        }
    }

    Rectangle  // 方法1:动画变化
    {
        id:flashLoad
        x: 400
        y:400
        //        text:"动画变化"
        width: 75
        height: 75
        color: "blue"
        opacity:1.0
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                animateColor.start();
                animateOpacity.start();
                animateWidth.start();
            }
        }

        PropertyAnimation   //颜色变化，属性类变化
        {
            id:animateColor
            target: flashLoad
            properties: "color"
            to:"green"
            duration: 5000
        }

        NumberAnimation     //透明度变化，数字类变化
        {
            id:animateOpacity
            target: flashLoad
            properties: "opacity"
            from:0.1
            to:1.0
            duration: 5000
        }
        NumberAnimation     //宽度变化，数字类变化
        {
            id:animateWidth
            target: flashLoad
            properties: "width"
            from:75
            to:100
            duration: 5000
        }
    }

    Rectangle   // 方法2:利用PropertyAnimation 进行动画
    {
        id:flashLoad2
        width: 100
        height: 100
        anchors.left: flashLoad.right
        anchors.leftMargin: 10
        color: "red"

        PropertyAnimation on y
        {
            to : 100
            duration:1000
        }

        PropertyAnimation on width
        {
            to:200
            duration:1000
        }
        //        ColorAnimation on color
        //        {
        //            to:"yellow"
        //            duration:1000
        //        }
        SequentialAnimation on color //按照队列来改变颜色
        {
            ColorAnimation
            {
                to:"yellow"
                duration:1000
            }
            ColorAnimation
            {
                to:"red"
                duration:1000
            }
        }
    }

    Rectangle   // 方法3:利用state和transitions，通过state来显示动画
    {
        id:button
        width: 75
        height: 75
        state:"release"
        anchors.bottom: parent.bottom

        MouseArea
        {
            anchors.fill:parent
            onPressed:
            {
                button.state = "press"
            }

            onReleased:
            {
                button.state = "release"
            }
        }


        states: [
            State {
                name: "press"
                PropertyChanges {
                    target: button
                    color: "lightblue"
                }
            },
            State {
                name: "release"
                PropertyChanges {
                    target: button
                    color: "blue"
                }
            }
        ]

        transitions:[
            Transition {
                from: "press"
                to: "release"

                ColorAnimation {
                    //                    from: "white"
                    //                    to: "black"
                    duration: 2000
                }
            },

            Transition {
                from: "release"
                to: "press"

                ColorAnimation {
                    //                    from: "white"
                    //                    to: "black"
                    duration: 2000
                }
            }
        ]

    }

    Rectangle
    {
        x:100
        id:banner
        width: 150
        height: 100
        border.color: "black"

        Column
        {
            anchors.centerIn: parent
            Text {
                id: code
                text: qsTr("Code les")
                opacity: 0.1
            }
            Text {
                id: creat
                text: qsTr("Cread more")
                opacity: 0.1
            }
            Text {
                id: deploy
                text: qsTr("Deloy everywhere")
                opacity: 0.1
            }


        }
        MouseArea
        {
            anchors.fill: parent  //可点击区域要写
            onPressed:
            {
//                console.log("tes");
                playBanner.start()
            }
        }
        SequentialAnimation
        {
            id:playBanner
            running: false

            NumberAnimation {
                target: code
                property: "opacity"
                to:1.0
                duration: 200
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: creat
                property: "opacity"
                to:1.0
                duration: 200
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: deploy
                property: "opacity"
                to:1.0
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }

}
