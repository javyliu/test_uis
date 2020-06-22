import 'package:flutter/material.dart';
class UiCookBook extends StatelessWidget {
  static final demoName = "食谱";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COOKBOOK"),
      ),
      body: Center(
        child: Text("heiehehe", style: TextStyle(fontSize: 40),),
      ),

    );
  }
}