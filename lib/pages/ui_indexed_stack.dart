import 'package:flutter/material.dart';
class UiIndexedStack extends StatefulWidget {
  final int initIdx;
  UiIndexedStack({Key key}) : initIdx=1, super(key: key){
    print("------------init Ui Indexed Stack------------");
  }
  @override
  _UiIndexedStackState createState() => _UiIndexedStackState();
}

class _UiIndexedStackState extends State<UiIndexedStack> {

  int _currentIdx;
  @override
  void initState() {
    super.initState();
    _currentIdx = widget.initIdx;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[10],
      child: IndexedStack(
        index: _currentIdx,
        children: <Widget>[
          Container(color: Colors.red[200],),
          Container(color: Colors.green[200],),
          Container(color: Colors.blue[200],),

        ],
        
      ),
      
    );
  }
}