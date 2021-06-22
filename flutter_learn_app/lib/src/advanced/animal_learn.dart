import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationLearnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画入门"),
      ),
      body: _AnimalTweenWight(),
    );
  }
}

class _AnimalTweenWight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimalTweenState();
  }
}

class _AnimalTweenState extends State<_AnimalTweenWight>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    // 让动画重复执行
    _controller.repeat(reverse: true);
    //和上面等价
    // _animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     // 动画结束时反向执行
    //     _controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     // 动画反向执行完毕时，重新执行
    //     _controller.forward();
    //   }
    // });


    // 创建一条震荡曲线
    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    // 创建从 50 到 200 线性变化的 Animation 对象
    _animation = Tween(begin: 50.0, end: 200.0).animate(curve)
      ..addListener(() {
        setState(() {}); // 刷新界面
      });
    _controller.forward(); // 启动动画
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: _animation.value, // 将动画的值赋给 widget 的宽高
            height: _animation.value,
            child: FlutterLogo()));
  }

  @override
  void dispose() {
    _controller.dispose(); // 释放资源
    super.dispose();
  }
}


class AnimatedLogo extends AnimatedWidget {
  //AnimatedWidget 需要在初始化时传入 animation 对象
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    // 取出动画对象
    final Animation<double> animation = listenable;
    return Center(
        child: Container(
          height: animation.value,// 根据动画对象的当前状态更新宽高
          width: animation.value,
          child: FlutterLogo(),
        ));
  }
}