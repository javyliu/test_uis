import 'package:flutter/material.dart';
import 'package:test_uis/pages/my_column.dart';
import 'package:test_uis/pages/my_stateless_widget.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("列表页")),
        body: Center(
            child: Column(
          children: <Widget>[
            Text("样列UI"),
            RaisedButton(
              child: Text("AppBar 使用"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyStatelessWidget(),
                )
              ),
            ),
            RaisedButton(
              child: Text("Column  使用"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyColumn(),
                )
              ),
            ),
          ],
        )));
  }
}
