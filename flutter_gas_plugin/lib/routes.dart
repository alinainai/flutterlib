import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page/invoke_method_page.dart';
import 'page/my_home_page.dart';

///路由页面
Map<String, Widget Function(BuildContext)> routes =
    <String, Widget Function(BuildContext)>{};

///增加PushName 方式跳转动画
Route<dynamic> generateRoutes(BuildContext context, String jsonStr) {
  print("json=$jsonStr");
  String _route;
  Map<String, dynamic> jsonMap;
  try {
    jsonMap = json.decode(jsonStr);
    _route = jsonMap["path"];
  } catch (e) {
    print(e);
    _route = jsonStr;
  }
  Function(BuildContext) _page = (context) => MyHomePage(
        title: "没有匹配到",
        message: "通过home变量",
      );

  switch (_route) {
    //接收到了匹配的规则，跳转到flutter指定页面
    case 'page1':
      _page = (context) => MyHomePage(
            title: "匹配到了page1",
            message: "通过home变量",
          );
      break;
    case 'page1Param':
      _page = (context) => MyHomePage(
            title: "匹配到了page1Param",
            message: jsonMap["param"],
          );
      break;
    case "InvokeMethodPage":
      _page = (context) => InvokeMethodPage(
            title: jsonMap["title"],
            channelName: jsonMap["channelName"],
            androidMethod: jsonMap["androidMethod"],
          );
      break;
    default:
      _page = (context) => MyHomePage(
            title: "没有匹配到",
            message: "通过home变量",
          );
      break;
  }
  return CupertinoPageRoute(builder: _page);
}
