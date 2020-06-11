import 'package:flutter/material.dart';

class UiProgressIndicator extends StatefulWidget {
  @override
  _UiProgressIndicatorState createState() => _UiProgressIndicatorState();
}

class _UiProgressIndicatorState extends State<UiProgressIndicator> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    print("------------${_animationController.value}------------");
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _visible = false;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度条"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Visibility(
              visible: _visible,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: SizedBox(
                height: 2.0,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  // valueColor: AlwaysStoppedAnimation(Colors.blue),
                  valueColor: ColorTween(begin: Colors.green, end: Colors.blue).animate(_animationController),
                  value: _animationController.value,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.green, end: Colors.blue).animate(_animationController),
                value: _animationController.value,
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
                child: Container(
                  color: Colors.grey,
                  child: Text("test"),
                  width: double.infinity,               
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
