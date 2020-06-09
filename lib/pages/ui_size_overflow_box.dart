import 'package:flutter/material.dart';

class UiSizeOverflowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedOverflowBox(
      size: Size(200, 50),
      alignment: Alignment.centerRight,
      //size属性设置了大小，container 里面的大小失效,
      child: Container(
        color: Color(0xfff06292),
        width: 50.0,
        height: 50.0,
        child: Text(
          "不知道怎么用， text 文本底部为什么会有两道横线？",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
