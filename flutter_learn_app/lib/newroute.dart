import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewRoute extends StatelessWidget {
  NewRoute({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示页面"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                  onPressed: () => Navigator.pop(context, "我是返回数据"),
                  child: Text("返回"))
            ],
          ),
        ),
      ),
    );
  }
}
