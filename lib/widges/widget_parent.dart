import 'package:flutter/material.dart';

class WidgetParent extends StatefulWidget {
  @override
  _WidgetParentState createState() => _WidgetParentState();
}

class _WidgetParentState extends State<WidgetParent> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
      SizedBox(
        height: 10,
      ),
      TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    ]);
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  TapboxB({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(active ? 'Active' : 'Inactive', style: TextStyle(fontSize: 32, color: Colors.white)),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  TapboxC({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    print("------_handleTapDown:------$details------------");
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails detail) {
    print("------_handleTapUp:------$detail------------");

    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    print("------_handleTapCancel:------------------");

    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    print("------_handleTap:------------------");

    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? Border.all(color: Colors.teal[700], width: 10) : null,
        ),
      ),
    );
  }
}
