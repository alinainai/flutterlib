import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("练习控件使用"),
      ),
      body: AppRootPage(),
    );
  }
}

class AppRootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppRootPageState();
  }
}

class _AppRootPageState extends State<AppRootPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 40, 30, 40),
      height: 50,
      child: Stack(children: <Widget>[
        Container(
          color: Colors.transparent,
          width: 240,
          height: 50,
        ),
        Positioned(
          left: 5,
          right: 5,
          top: 23.5,
          bottom: 23.5,
          child: Container(
            width: 240,
            height: 3,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue, Colors.red],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
          ),
        ),
        buildThem()

        // buildThem(),
      ]),
    );
  }

  //Slider的值
  double _sliderValue = 1.0;

  Widget buildThem() {
    return Theme(
      data: ThemeData(
          sliderTheme: SliderThemeData(
              trackHeight: 1,
              //滑块的颜色
              thumbColor: Colors.white,
              //滑块的大小
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
              //点击滑块边缘的颜色
              overlayColor: Colors.deepPurpleAccent.withOpacity(0.2),
              //点击滑块边缘的显示半径
              overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
              //滑动左侧滚动条的颜色
              activeTrackColor: Colors.transparent,
              //滚动条右侧的颜色
              inactiveTrackColor: Colors.transparent,
              //任何情况都显示气泡
              showValueIndicator: ShowValueIndicator.always,
              // showValueIndicator: ShowValueIndicator.never,
              // thumbShape: const _ThumbShape(),
              //气泡的文字样式
              valueIndicatorTextStyle: TextStyle(color: Colors.white),
              //气泡的背景
              valueIndicatorColor: Colors.greenAccent)),
      child: buildSliderWidget(),
    );
  }

  Widget buildSliderWidget() {
    return Slider(
      //Slider的当前的值  0.0 ~ 1.0
      value: _sliderValue,
      min: 1.0,
      max: 100.0,
      //平均分成的等分
      divisions: 5,
      //滚动时会回调
      onChanged: (double value) {
        _sliderValue = value;
        print("Value $_sliderValue");
        setState(() {});
      },
      onChangeStart: (double startValue) {
        print("开始滚动");
      },
      onChangeEnd: (double endValue) {
        print("停止 滚动");
      },
      //滑块以及滑动左侧的滚动条颜色
      // activeColor: Colors.redAccent,
      //滑块右侧的滚动条颜色
      // inactiveColor: Colors.blue,
      //气泡
      label: "${_sliderValue.toStringAsFixed(1)}",
    );
  }
}

// class _ThumbShape extends RoundSliderThumbShape {
//   final _indicatorShape = const PaddleSliderValueIndicatorShape();
//
//   const _ThumbShape();
//
//  @override
//   void paint(PaintingContext context, Offset center, {Animation<double> activationAnimation, Animation<double> enableAnimation, bool isDiscrete, TextPainter labelPainter, RenderBox parentBox, SliderThemeData sliderTheme, TextDirection textDirection, double value, double textScaleFactor, Size sizeWithOverflow}) {
//    super.paint(context, center,
//        activationAnimation: activationAnimation,
//        enableAnimation: enableAnimation,
//        sliderTheme: sliderTheme);
//    _indicatorShape.paint(
//      context,
//      center,
//      activationAnimation: const AlwaysStoppedAnimation(1),
//      enableAnimation: enableAnimation,
//      labelPainter: labelPainter,
//      parentBox: parentBox,
//      sliderTheme: sliderTheme,
//      value: value,
// // test different testScaleFactor to find your best fit
//      textScaleFactor: 0.6 ,
//      sizeWithOverflow: sizeWithOverflow,
//    );
//
//  }
// }
