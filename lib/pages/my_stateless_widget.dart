import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('显示一个底部小页面，约三约消失， 用于信息提示'));

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);




  void openPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('二级页面')),
          body: const Center(
            
            child: Text(
              '这是从首页跳转过来的页面',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    print("------------build 被调用------------");
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('AppBar 使用'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: '显示一个底部小页面，用于展示简短信息',
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(snackBar);
              }),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: '下一个页面',
            onPressed: () {
              openPage(context);
            },
          )
        ],
      ),
      body: const Center(
        child: Text(
          '这是首页',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
