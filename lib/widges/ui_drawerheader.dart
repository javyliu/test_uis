import 'package:flutter/material.dart';

///抽取出Drawerheader
///
class UiDrawerHeader extends StatelessWidget {
  final String imgUrl;
  final String uname;
  final String secondName;
  final String verifyStr;

  const UiDrawerHeader(
      {Key key, this.uname = '账号名字', this.secondName = '副标题', this.verifyStr = '已认证', this.imgUrl = 'https://b-ssl.duitang.com/uploads/item/201809/09/20180909200211_vikkq.thumb.700_0.jpeg'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.red),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.all(1.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imgUrl),
                radius: 50.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight + Alignment(0, -0.4),
            child: Text(uname, style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(secondName, style: TextStyle(color: Colors.white70)),
          ),
          Align(
            alignment: Alignment.centerRight + Alignment(0, 0.5),
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.greenAccent), borderRadius: BorderRadius.circular(5), color: Colors.green),
              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
              child: Text(verifyStr, style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}