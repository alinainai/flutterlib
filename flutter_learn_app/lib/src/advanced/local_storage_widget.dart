import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_app/common/global.dart';

class LocalStorageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据持久化"),
      ),
      body: Column(
        children: [
          FlatButton(
              onPressed: () => {},
              child: Text(
                "写本地文件",
                style: TextStyleMs.white_00_14,
              )),
          FlatButton(
              onPressed: () => {},
              child: Text(
                "读本地文件",
                style: TextStyleMs.white_00_14,
              )),
          FlatButton(
              onPressed: () => {},
              child: Text(
                "写本地文件",
                style: TextStyleMs.white_00_14,
              )),
        ],
      ),
    );
  }
}
