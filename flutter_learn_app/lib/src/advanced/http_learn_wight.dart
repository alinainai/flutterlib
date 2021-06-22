import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learn_app/common/global.dart';

class HttpLearnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络请求"),
      ),
      body: _HttpJsonWidget(),
    );
  }
}

class _HttpJsonWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HttpJsonState("显示加载中文案");
  }
}

class _HttpJsonState extends State<_HttpJsonWidget> {
  _HttpJsonState(this._showText);

  String _showText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
            onPressed: () => {getRequest()},
            child: Text(
              "点击加载",
              style: TextStyleMs.black_00_14,
            )),
        Text(_showText, style: TextStyleMs.red_00_14)
      ],
    );
  }

  void getRequest() async {
    // 创建网络调用示例
    Dio dio = new Dio();
    // 设置 URI 及请求 user-agent 后发起请求
    var response = await dio.get("https://flutter.dev",
        options: Options(headers: {"user-agent": "Custom-UA"}));
    // 打印请求结果
    if (response.statusCode == HttpStatus.ok) {
      print(response.data.toString());
      _showText = response.data.toString();
      setState(() {});
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
