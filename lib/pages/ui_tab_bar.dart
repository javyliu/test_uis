import 'package:flutter/material.dart';

class UiTabBar extends StatefulWidget {
  @override
  _UiTabBarState createState() => _UiTabBarState();
}

class _UiTabBarState extends State<UiTabBar> with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Map> _tabMapAry;

  @override
  void initState() {
    super.initState();
    _tabMapAry = [
      {
        "title": "第一个",
        "tab_view": Column(children: <Widget>[
          Text("渐显动画"),
          UiFadeTransition(
            child: Container(
              child: Text("这是动画"),
              color: Colors.redAccent,
              width: 100,
              height: 100,
            ),
          )
        ])
      },
      {"title": "第二个", "tab_view": Text("第二个切换内容")},
      {"title": "第三个", "tab_view": Text("第三个切换内容")},
      {"title": "第四个", "tab_view": Text("第四个切换内容")},
      {"title": "第五个", "tab_view": Text("第五个切换内容")},
      {"title": "第六个", "tab_view": Text("第六个切换内容")},
    ];
    _tabController = TabController(vsync: this, length: _tabMapAry.length);
  }

  List<Widget> _drawerChildern(void _callback()) {
    return <Widget>[
      UiDrawerHeader(),
      ListTile(onTap: _callback, leading: Icon(Icons.message), title: Text("用户信息"), trailing: Icon(Icons.arrow_right)),
      Divider(height: 2, color: Colors.red),
      ListTile(onTap: _callback, leading: Icon(Icons.person), title: Text("账号"), trailing: Icon(Icons.arrow_right)),
      Divider(height: 2, color: Colors.red),
      ListTile(onTap: _callback, leading: Icon(Icons.account_circle), title: Text("简况"), trailing: Icon(Icons.arrow_right)),
      Divider(height: 2, color: Colors.red),
      ListTile(onTap: _callback, leading: Icon(Icons.settings), title: Text("配置"), trailing: Icon(Icons.arrow_right)),
      Divider(height: 2, color: Colors.red),
      ListTile(onTap: _callback, leading: Icon(Icons.change_history), title: Text("更改历史"), trailing: Icon(Icons.arrow_right)),
    ];
  }

  ///可以把TabBar放到AppBar的bottom 或 title 属性中
  @override
  Widget build(BuildContext context) {
    void _callback() => Navigator.pop(context);
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("TabBar的使用"),
        // title: SizedBox(
        //   height: 56,
        //   child: TabBar(
        //     controller: _tabController,
        //     tabs: _tabMapAry.map((item) => Tab(text: item["title"])).toList(),
        //     isScrollable: true,
        //     indicatorColor: Colors.amber,

        //   ),
        // ),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabMapAry.map((item) => Tab(text: item['title'])).toList(),
          isScrollable: true,
          indicatorColor: Colors.amber,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: _drawerChildern(_callback),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabMapAry.map((item) => item["tab_view"] as Widget).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

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

///渐显动画组件
class UiFadeTransition extends StatefulWidget {
  final Widget child;

  UiFadeTransition({Key key, @required this.child}) : super(key: key);
  @override
  _UiFadeTransitionState createState() => _UiFadeTransitionState();
}

class _UiFadeTransitionState extends State<UiFadeTransition> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
