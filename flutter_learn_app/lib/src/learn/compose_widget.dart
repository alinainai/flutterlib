import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComposeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("练习控件使用"),
      ),
      body: ComposeItem(
        model: UpdateItemModel(
            appIcon: "assets/images/beautiful_girl.jpeg",
            appName: "Google Map - Trans",
            appSize: "128M",
            appDescription: "afdfsdg",
            appVersion: "1.5.3.1",
            appDate: "2020-01-20"),
        onPressed: () => {print("pressed")},
      ),
    );
  }
}

class ComposeItem extends StatelessWidget {
  final UpdateItemModel model; // 数据模型
  final VoidCallback onPressed;

  // 构造函数语法糖，用来给 model 赋值
  ComposeItem({Key key, this.model, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    model.appIcon,
                    fit: BoxFit.fitWidth,
                    width: 80,
                    height: 80,
                  )),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.appName,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                Text(model.appDate,
                    style: TextStyle(fontSize: 12, color: Colors.black54))
              ],
            )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: FlatButton(
                  height: 35,
                  minWidth: 80,
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("open"),
                  onPressed: onPressed),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "基本上根据这些属性名字就能看出这些属性都是干啥的，这里面咱只"
            "看fit这个东西，这里有专门讲"
            "解这一块用法的一个文章image,(这里说明一下，由于网上"
            "的这篇文章大多都长得一样，本人也没分辨出真正作者是谁，如果"
            "该链接文章的作者看到的话可以联系我，我把链接改成你的)",
            style: TextStyle(fontSize: 12, color: Colors.black),
            maxLines: 3,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text("${ model.appVersion} - ${model.appSize}"
          ,
            style: TextStyle(fontSize: 12, color: Colors.black),
            maxLines: 3,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

class UpdateItemModel {
  String appIcon; //App 图标
  String appName; //App 名称
  String appSize; //App 大小
  String appDate; //App 更新日期
  String appDescription; //App 更新文案
  String appVersion; //App 版本
  // 构造函数语法糖，为属性赋值
  UpdateItemModel(
      {this.appIcon,
      this.appName,
      this.appSize,
      this.appDate,
      this.appDescription,
      this.appVersion});
}
