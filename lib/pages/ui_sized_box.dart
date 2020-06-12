import 'package:flutter/material.dart';

class UiSizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      // color: Colors.blue[50],
      child: SizedBox(
        // height: 32,
        // width: 100,
        child: RaisedButton(
          onPressed: () => print("clicked"),
          child: Text("按钮", style: TextStyle(color: Colors.green)),
          color: Colors.cyan[100],
        ),
      ),
    );
  }
}
