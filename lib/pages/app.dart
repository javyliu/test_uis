import 'package:flutter/material.dart';
import 'package:test_uis/pages/my_column.dart';
import 'package:test_uis/pages/my_stateless_widget.dart';
import 'package:test_uis/pages/ui_align.dart';
import 'package:test_uis/pages/ui_aspect_ratio.dart';
import 'package:test_uis/pages/ui_buttons.dart';
import 'package:test_uis/pages/ui_row.dart';
import 'package:test_uis/pages/ui_scaffold.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("列表页")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("样列UI"),
            RaisedButton(
              child: Text("AppBar 使用"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyStatelessWidget(),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Column  使用"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyColumn(),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Button  使用"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => UiButton(),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Row  使用"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => UiRow(),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Scaffold  使用"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => UiScaffold(),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Align  使用"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => UiAlign(),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Aspect Ratio  使用"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => UiAspetRatio(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
