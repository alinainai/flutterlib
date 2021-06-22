import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learn_app/common/global.dart';

class BaseWight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String msg = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          title: Text("提示页面 $msg"),
        ),
        body: Column(
          children: [
            Text.rich(
              TextSpan(children: <TextSpan>[
                TextSpan(
                    text: '文本是视图系统中常见的控件，它用来显示一段特定样式的字符串，类似',
                    style: TextStyleMs.red_00_14),
                // 第 1 个片段，红色样式
                TextSpan(text: 'Android', style: TextStyleMs.black_00_14),
                // 第 1 个片段，黑色样式
                TextSpan(text: '中的', style: TextStyleMs.red_00_14),
                // 第 1 个片段，红色样式
                TextSpan(text: 'TextView', style: TextStyleMs.black_00_14)
                // 第 1 个片段，黑色样式
              ]),
              textAlign: TextAlign.center,
            ),
            FlatButton(onPressed: ()=>Navigator.pop(context,"返回的数据"), child: Image.asset("assets/images/beautiful_girl.jpeg",
                width: 100, height: 100))
            ,
            //单一child的wight Container、Padding、Center
            Container(
              child: Text(
                "单子：我是container包裹的text",
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              width: 200,
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '单子：我是Padding包裹的text',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "单子：我是container中Center包裹的text",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(40),
              width: 300,
              height: 50,
              // alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            //多子View控件 Row、Column、Expanded
            //Row 的用法示范
            Row(
              children: <Widget>[
                //使用Expended 填充额外空间
                Expanded(
                    flex: 1,
                    child: Container(color: Colors.yellow, height: 60)),
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 60,
                ),
                Container(
                  color: Colors.black,
                  width: 60,
                  height: 50,
                ),
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.green, height: 60),
                )
              ],
            ),
            Row(
              //设置主轴对齐样式
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end, //右对齐
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均匀分布
              mainAxisSize: MainAxisSize.max,
              //设置纵轴对齐样式
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  width: 60,
                  height: 80,
                ),
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 60,
                ),
                Container(
                  color: Colors.black,
                  width: 60,
                  height: 80,
                ),
                Container(
                  color: Colors.green,
                  width: 60,
                  height: 80,
                ),
              ],
            ),
            //层叠 Widget 布局：Stack 与 Positioned
            Stack(
              overflow: Overflow.visible,
              fit: StackFit.loose,
              children: <Widget>[
                Container(color: Colors.yellow, width: 150, height: 200),
                // 黄色容器
                Positioned(
                  left: 18.0,
                  top: 18.0,
                  child: Container(
                      color: Colors.green,
                      width: 50,
                      height: 50), // 叠加在黄色容器之上的绿色控件
                ),
                Positioned(
                  left: 18.0,
                  top: 70.0,
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Text("Stack 提供了层叠布局的容器 ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis), // 叠加在黄色容器之上的文本
                  ),
                )
              ],
            )
          ],
        ));
  }
}
