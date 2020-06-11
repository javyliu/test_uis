import 'package:flutter/material.dart';

class UiHeroA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Material(
        child: InkWell(
          child: Hero(
            tag: 'avatar',
            child: ClipOval(
              child: Image.asset("images/lake.jpg", width: 50.0),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation, Animation secondAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("原图"),
                    ),
                    body: UiHeroB(),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

class UiHeroB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar",
        child: Image.asset("images/lake.jpg"),
      ),
    );
  }
}
