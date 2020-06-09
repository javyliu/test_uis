import 'package:flutter/material.dart';

class UiAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对齐组件"),
      ),
      body: Container(
        height: 480.0,
        width: 480.0,
        color: Colors.blue[50],
        child: Align(
          alignment: Alignment.center,
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
