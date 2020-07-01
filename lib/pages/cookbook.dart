import 'package:flutter/material.dart';

class UiCookBook extends StatefulWidget {
  static final demoName = "食谱";

  @override
  _UiCookBookState createState() => _UiCookBookState();
}

class _UiCookBookState extends State<UiCookBook> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COOKBOOK"),
      ),
      body: Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300, 200)),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            // behavior: HitTestBehavior.translucent,
            onPointerDown: (event) => print("down 0"),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200,100)),
              child: Center(child: Text("左下角200*100范围内非文本区域点击"),),
            ),
            onPointerDown: (event) => print("down1"),
            behavior: HitTestBehavior.opaque,
          ),
          Listener(
            child: IgnorePointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200,
                  height: 100,
                ),
                onPointerDown: (event) => print("in"),
              ),              
            ),
            onPointerDown: (event) => print("up"),
          )
        ],
      ),
    );
  }
}
