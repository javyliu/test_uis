import 'package:flutter/material.dart';

class UiAbsorbPointer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Map> _showMyDialog() async {
      return showDialog<Map>(
        context: context,
        //由这个属性来确认点击其它地方是否可以关闭，true表示可以，false表示不可，只允许点按钮来关闭
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("弹出框标题"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("使用 SingleChildScrollView 套用 ListBody"),
                  Text("由 ListBody 来显示多个Text Widget"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop({"result": false});
                },
              ),
              FlatButton(
                child: Text("确认"),
                onPressed: () {
                  Navigator.of(context).pop({"result": true});
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _changeLanguage() async {
      int i = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('简体中文'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('英文'),
                ),
              ),
            ],
          );
        } ,
      );
      if (i != null) {
        print("选择了： ${i==1 ? '简体中文' : '英文'}");
      }
    }

    return Center(
      child: AbsorbPointer(
        absorbing: false,
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('测试点击屏蔽1'),
              color: Colors.amber,
              // onPressed: () => print("-----------点击测试----------"),
              onPressed: () async {
                var result = await _showMyDialog();
                print("result is $result ");
              },
            ),
            RaisedButton(
              child: Text('Simple Dialog '),
              color: Colors.amber,
              onPressed: () {
                _changeLanguage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
