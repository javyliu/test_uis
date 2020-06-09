import 'package:flutter/material.dart';
class UiAspetRatio extends StatelessWidget {
  UiAspetRatio({Key key }){
    print("------------Ui aspet Ratio init------------");
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 16/2,
        child: Container(
          color: Colors.blue,
          child: Text("我是比例控制组件", style: TextStyle(fontSize: 16),),
        ),
      ),


    );
  }
}