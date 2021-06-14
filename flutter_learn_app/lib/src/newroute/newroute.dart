import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewRoute extends StatefulWidget {
  NewRoute({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  State<StatefulWidget> createState() {
    return new _NewRouteState();
  }
}

class _NewRouteState extends State<NewRoute>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("提示页面"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(widget.text),
              RaisedButton(
                  onPressed: () => Navigator.pop(context, "我是返回数据"),
                  child: Text("返回")),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    print('init NewRoute state');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('NewRoute did change dependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant NewRoute oldWidget) {
    print('NewRoute did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('NewRoute deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('NewRoute dispose');
    super.dispose();
  }

  @override
  void reassemble() {
    print('NewRoute reassemble');
    super.reassemble();
  }

}
