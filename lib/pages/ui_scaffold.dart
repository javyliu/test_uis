import 'package:flutter/material.dart';
class UiScaffold extends StatefulWidget {
  UiScaffold(){
    print("------------ui scaffold construct------------");
  }
  @override
  _UiScaffoldState createState() => _UiScaffoldState();
}

class _UiScaffoldState extends State<UiScaffold> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Scaffold'),
      ),
      body: Center(
        child: Text("点击次数：$_count")
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState( () => _count++ ),
        tooltip: "增加次数",
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.blueGrey.shade200,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}