import 'package:flutter/material.dart';

class UiOverflowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 200,
        // height: 300,
        color: Colors.amber[100],
        child: OverflowBox(
          maxHeight: 150,
          maxWidth: 250,
          minHeight: 30,
          minWidth: 40,
          alignment: Alignment.centerLeft,
          child: Text(
            "如何控制大小？",
            style: TextStyle(
              fontSize: 50,
              decorationThickness: 0 ,
            ),
          ),
        ));
  }
}
