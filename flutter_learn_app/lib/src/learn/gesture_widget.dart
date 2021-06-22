import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureWight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("响应事件"),
        ),
        body: _BrokenGestureWight()
        // _GestureRecognizerWight()
        // _GestureWight()
        // _PointerWidget()
        //

        );
  }
}

//子类会首先响应点击事件，在GestureDetector 内部对每一个手势都建立了一个工厂类（Gesture Factory）。
// 而工厂类的内部会使用手势识别类（GestureRecognizer），来确定当前处理的手势。
// 而所有手势的工厂类都会被交给 RawGestureDetector 类，以完成监测手势的大量工作：
// 使用 Listener 监听原始指针事件，并在状态改变时把信息同步给所有的手势识别器，然后这些手势会在竞技场决定最后由谁来响应用户事件。
// I/flutter (17883): Child tapped
class _GestureRecognizerWight extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Parent tapped'),// 父视图的点击回调
      child: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: GestureDetector(
            onTap: () => print('Child tapped'),// 子视图的点击回调
            child: Container(
              color: Colors.blueAccent,
              width: 200.0,
              height: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}


class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
//破坏事件竞技场，父控件也能响应点击事件
// I/flutter (17883): Child tapped
// I/flutter (17883): parent tapped
class _BrokenGestureWight extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(// 自己构造父 Widget 的手势识别映射关系
      gestures: {
        // 建立多手势识别器与手势识别工厂类的映射关系，从而返回可以响应该手势的 recognizer
        MultipleTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
            MultipleTapGestureRecognizer>(
              () => MultipleTapGestureRecognizer(),
              (MultipleTapGestureRecognizer instance) {
            instance.onTap = () => print('parent tapped ');// 点击回调
          },
        )
      },
      child: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: GestureDetector(// 子视图可以继续使用 GestureDetector
            onTap: () => print('Child tapped'),
            child: Container(
              color: Colors.blueAccent,
              width: 200.0,
              height: 200.0,
            ),
          ),
        ),
      ),
    );
  }

}

//Gesture响应事件
class _GestureWight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureState();
  }
}

class _GestureState extends State<_GestureWight> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // 使用 Stack 组件去叠加视图，便于直接控制视图坐标
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          // 手势识别
          child: GestureDetector(
            // 红色子视图
            child: Container(color: Colors.red, width: 50, height: 50),
            // 点击回调
            onTap: () => print("Tap"),
            // 双击回调
            onDoubleTap: () => print("Double Tap"),
            // 长按回调
            onLongPress: () => print("Long Press"),
            // 拖动回调
            onPanUpdate: (e) {
              setState(() {
                // 更新位置
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
          ),
        )
      ],
    );
  }
}

//指针响应事件
class _PointerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        color: Colors.red,
        width: 300,
        height: 300,
      ),
      onPointerDown: (event) => {print("down $event")},
      onPointerMove: (event) => {print("move $event")},
      onPointerUp: (event) => {print("up $event")},
    );
  }
}
