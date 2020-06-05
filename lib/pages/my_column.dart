import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  const MyColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column example"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text("延续一个"),
              Text(
                "Column的\n宽度是子元素的宽度,\n换\n行时的最大\n宽度是屏幕的宽度",
                maxLines: 2,
              ),
              Expanded(
                child: Container(
                  child: Text("延续一个"),
                  color: Colors.red,
                ),
              ),
              Expanded(child: FittedBox(child: FlutterLogo(), fit: BoxFit.contain))
            ],
          ),
      ),
    );
  }
}
