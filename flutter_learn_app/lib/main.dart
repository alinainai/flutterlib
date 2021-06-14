import 'package:flutter/material.dart';
import 'package:flutter_learn_app/src/learn/compose_widget.dart';
import 'package:flutter_learn_app/src/learn/base_wight.dart';
import 'package:flutter_learn_app/src/learn/slider_wight.dart';
import 'package:flutter_learn_app/src/newroute/newroute.dart';
import 'package:flutter_learn_app/src/wight/customwidget.dart';
import 'package:logging/logging.dart';

import 'common/global.dart';

final _mainLogger = Logger("main");

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        Global.ROUTER_NEW_PAGE: (context) =>
            NewRoute(text: ModalRoute.of(context).settings.arguments),
        Global.ROUTER_PARENT_WIGHT: (context) => BaseWight(),
        Global.ROUTER_COMPOS_WIDGET: (context) => ComposeWidget(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() {
    print('create main state');
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;
  final TextStyle _blackStyle = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black); // 黑色样式
  final TextStyle _redStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red); // 红色样式

  @override
  Widget build(BuildContext context) {
    print('main build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(
                  text: '文本是视图系统中常见的控件，它用来显示一段特定样式的字符串，类似', style: _redStyle),
              // 第 1 个片段，红色样式
              TextSpan(text: 'Android', style: _blackStyle),
              // 第 1 个片段，黑色样式
              TextSpan(text: '中的', style: _redStyle),
              // 第 1 个片段，红色样式
              TextSpan(text: 'TextView', style: _blackStyle)
              // 第 1 个片段，黑色样式
            ]),
            textAlign: TextAlign.center,
          ),
          RandomWordsWidget(),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          Image.asset("assets/images/beautiful_girl.jpeg",
              width: 100, height: 100),
          FlatButton(
            child: Text("open new route"),
            textColor: Colors.blue,
            onPressed: () async {
              //导航到新路由
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return NewRoute(text: "我是传过来的数据");
              }));
              print("收到的数据=$result");

              // Navigator.pushNamed(context, "new_page", arguments: "hi");
            },
          ),
          FlatButton(
              // 设置背景色为黄色
              color: Colors.yellow,
              // 设置斜角矩形边框
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              // 确保文字按钮为深色
              colorBrightness: Brightness.light,
              onPressed: () =>
                  {Navigator.pushNamed(context, Global.ROUTER_PARENT_WIGHT)},
              // onPressed: () => {Navigator.pushNamed(context, Global.ROUTER_PARENT_WIGHT)},
              child: Row(
                children: <Widget>[Icon(Icons.add), Text("跳转到基础wight界面")],
              )),
          FlatButton(
              // 设置背景色为黄色
              color: Colors.blue,
              // 设置斜角矩形边框
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              // 确保文字按钮为深色
              colorBrightness: Brightness.light,
              onPressed: () =>
                  {Navigator.pushNamed(context, Global.ROUTER_COMPOS_WIDGET)},
              // onPressed: () => {Navigator.pushNamed(context, Global.ROUTER_PARENT_WIGHT)},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Icon(Icons.add), Text("跳转到基础wight界面")],
              ))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    print('main setState');
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    print('init main state');
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    print('main did change dependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    print('main did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('main deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('main dispose');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void reassemble() {
    print('main reassemble');
    super.reassemble();
  }

  //监听app的生命周期，在 initState 绑定，在 dispose 移除
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('main didChangeAppLifecycleState $state');
  }
}
