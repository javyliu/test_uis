import 'package:flutter/material.dart';

///通过继承AnimatedWidget来使用
class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Center(
      child: Image.asset("images/lake.jpg", width: animation.value, height: animation.value),
    );
  }
}

///通过添加一个组件来实现
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (BuildContext ctx, Widget child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}

class UiAnimatedWidget extends StatefulWidget {
  @override
  _UiAnimatedWidgetState createState() => _UiAnimatedWidgetState();
}

class _UiAnimatedWidgetState extends State<UiAnimatedWidget> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // return AnimatedImage(animation: animation,);
    ///通过AnimatedBuilder 使用
    // return AnimatedBuilder(
    //   animation: animation,
    //   child: Image.asset("images/lake.jpg"),
    //   builder: (BuildContext ctx, Widget child){
    //     return Center(
    //       child: Container(
    //         height: animation.value,
    //         width: animation.value,
    //         child: child,
    //       )
    //     );
    //   },
    // );
    return GrowTransition(
      animation: animation,
      child: Image.asset("images/lake.jpg"),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
