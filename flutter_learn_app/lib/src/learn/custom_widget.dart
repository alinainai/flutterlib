import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义控件"),
      ),
      body: Cake(),
    );
  }
}


class WheelPainter extends CustomPainter {
  Paint getColoredPaint(Color color) {
    // 根据颜色返回不同的画笔
    Paint paint = Paint(); // 生成画笔
    paint.color = color; // 设置画笔颜色
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double wheelSize = min(size.width, size.height) / 2; // 饼图的尺寸
    double nbElem = 6; // 分成 6 份
    double radius = (2 * pi) / nbElem; //1/6 圆
    // 包裹饼图这个圆形的矩形框
    Rect boundingRect = Rect.fromCircle(
        center: Offset(wheelSize, wheelSize), radius: wheelSize);
    // 每次画 1/6 个圆弧
    canvas.drawArc(
        boundingRect, 0, radius, true, getColoredPaint(Colors.orange));
    canvas.drawArc(
        boundingRect, radius, radius, true, getColoredPaint(Colors.black38));
    canvas.drawArc(
        boundingRect, radius * 2, radius, true, getColoredPaint(Colors.green));
    canvas.drawArc(
        boundingRect, radius * 3, radius, true, getColoredPaint(Colors.red));
    canvas.drawArc(
        boundingRect, radius * 4, radius, true, getColoredPaint(Colors.blue));
    canvas.drawArc(
        boundingRect, radius * 5, radius, true, getColoredPaint(Colors.pink));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

// 将饼图包装成一个新的控件
class Cake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: WheelPainter(),
    );
  }
}


