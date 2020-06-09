import 'package:flutter/material.dart';

class UiButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            const RaisedButton(
              onPressed: null,
              child: Text(
                "如果未设置回调不可点击",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {},
              color: Colors.tealAccent,
              child: const Text('可以点击', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                
              },
              onLongPress: () => print("------------clicked...------------"),
              textColor: Colors.white,
              padding: const EdgeInsets.all(0),
              child: Container(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0, top: 4, bottom:4),
                child: const Text("渐变按钮", style: TextStyle(fontSize: 20)),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xff0d47a1),
                      Color(0xff1976d2),
                      Color(0xff42a5f5),
                    ]
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
