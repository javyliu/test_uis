import 'package:flutter/material.dart';

class UiContainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          // maxHeight: 100,
          // maxWidth: 150,
          minHeight: 50,
          // minWidth: 100,
        ),
        // child: Container(
        //   color: Colors.amberAccent,
        //   child: Text("ConstrainedBox 组件", style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
        // ),
        child: RaisedButton(
          child: Text('Tap me!'),
          onPressed: () {
            
          },
        ),
      ),
    );
  }
}
