import 'package:flutter/material.dart';

class UiAnimatedContainer extends StatefulWidget {
  @override
  _UiAnimatedContainerState createState() => _UiAnimatedContainerState();
}

class _UiAnimatedContainerState extends State<UiAnimatedContainer> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: _selected ? 200 : 100,
          height: _selected ? 100 : 200,
          color: _selected ? Colors.red : Colors.blue,
          alignment: _selected ? Alignment.center : Alignment.topCenter,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: FlutterLogo(
            size: 75,
          ),
        ),
      ),
    );
  }
}
