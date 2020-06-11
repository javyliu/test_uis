import 'package:flutter/material.dart';
class UiBottomNavigationBar extends StatefulWidget {
  @override
  _UiBottomNavigationBarState createState() => _UiBottomNavigationBarState();
}

class _UiBottomNavigationBarState extends State<UiBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text("Index 0: Home", style: optionStyle),
    Text("Index 1: Business", style: optionStyle),
    Text("Index 2: School", style: optionStyle),
    Text("Index 3: Access Time", style: optionStyle),
    Text("Index 4: Account Box", style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("底部导航"),),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex),),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("Business")),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("School")),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), title: Text("AccessTime")),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), title: Text("AccountBox")),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      
    );
  }
}