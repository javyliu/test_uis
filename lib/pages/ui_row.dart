import 'package:flutter/material.dart';

class UiRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('行'),
      ),
      body: Container(
        color: Colors.blue[20],
        child: Row(
          children: <Widget>[
            Text("123k12039we", maxLines: 1,),
            Text(
                "二行文本",
                textAlign: TextAlign.center,
              ),
            
            Expanded(
              child: Text(
                "三行文本",
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                "四行文本",
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: const FlutterLogo(size: 150,)
            ),
          ],
        ),
      ),
    );
  }
}
