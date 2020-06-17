import 'package:flutter/material.dart';
import 'package:test_uis/pages/my_column.dart';
import 'package:test_uis/pages/my_stateless_widget.dart';
import 'package:test_uis/pages/ui_absorb_pointer.dart';
import 'package:test_uis/pages/ui_align.dart';
import 'package:test_uis/pages/ui_animated_container.dart';
import 'package:test_uis/pages/ui_animated_switcher.dart';
import 'package:test_uis/pages/ui_animated_widget.dart';
import 'package:test_uis/pages/ui_aspect_ratio.dart';
import 'package:test_uis/pages/ui_base_animation.dart';
import 'package:test_uis/pages/ui_bottom_navigation_bar.dart';
import 'package:test_uis/pages/ui_buttons.dart';
import 'package:test_uis/pages/ui_card.dart';
import 'package:test_uis/pages/ui_contrained_box.dart';
import 'package:test_uis/pages/ui_dismissible.dart';
import 'package:test_uis/pages/ui_flutter_slidable.dart';
import 'package:test_uis/pages/ui_hero.dart';
import 'package:test_uis/pages/ui_indexed_stack.dart';
import 'package:test_uis/pages/ui_overflow_box.dart';
import 'package:test_uis/pages/ui_progress_indicator.dart';
import 'package:test_uis/pages/ui_row.dart';
import 'package:test_uis/pages/ui_scaffold.dart';
import 'package:test_uis/pages/ui_simultaneous_animation.dart';
import 'package:test_uis/pages/ui_size_overflow_box.dart';
import 'package:test_uis/pages/ui_sized_box.dart';
import 'package:test_uis/pages/ui_tab_bar.dart';
import 'package:test_uis/pages/ui_tutorial.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);
  final Map<String, Function> routes = {
    "AppBar 使用": (BuildContext context) => MyStatelessWidget(),
    "Column 使用": (BuildContext context) => MyColumn(),
    "Button 使用": (BuildContext context) => UiButton(),
    "Row 使用": (BuildContext context) => UiRow(),
    "Scaffold 使用": (BuildContext context) => UiScaffold(),
    "Align 使用": (BuildContext context) => UiAlign(),
    "Aspect Ratio 使用": (BuildContext context) => UiAspetRatio(),
    "SizedOverflowBox 使用": (BuildContext context) => UiSizeOverflowBox(),
    "overflowbox 使用": (BuildContext context) => UiOverflowBox(),
    "sizedBox 使用": (BuildContext context) => UiSizedBox(),
    "ContrainedBox 使用": (BuildContext context) => UiContainedBox(),
    "IndexedStack 使用": (BuildContext context) => UiIndexedStack(),
    "Layout Tutorial 使用": (BuildContext context) => UiTutorial(),
    "AbsorbPointer 使用(包括弹出框)": (BuildContext context) => UiAbsorbPointer(),
    "AnimatedContainer 使用": (BuildContext context) => UiAnimatedContainer(),
    "AnimatedSwitcher 使用": (BuildContext context) => UiAnimatedSwitcher(),
    "ScaleAnimation (base animation) 使用": (BuildContext context) => UiBaseAnimation(),
    "AnimatedWidget 使用": (BuildContext context) => UiAnimatedWidget(),
    "Hero 使用": (BuildContext context) => UiHeroA(),
    "同时执行动画": (BuildContext context) => UiLogoApp(),
    "底部导航": (BuildContext context) => UiBottomNavigationBar(),
    "进度条": (BuildContext context) => UiProgressIndicator(),
    "AppBar 底部导航Tab": (BuildContext context) => UiTabBar(),
    "Card 使用and Chip": (BuildContext context) => UiCard(),
    "Dismissible 使用": (BuildContext context) => UiDismissible(),
    "Flutter slidable 使用": (BuildContext context) => UiFlutterSlidable(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("样列UI")),
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        // padding: const EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        // reverse: true,
        itemCount: routes.length,
        itemBuilder: (context, index) {
          String key = routes.keys.toList()[index];
          print("------------$index------------");
          return SizedBox(
            height: 50,
            child: RaisedButton(
              // color: Colors.teal[50],
              child: Align(child: Text(key, textAlign: TextAlign.left), alignment: Alignment.centerLeft),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: routes[key],
                ),
              ),
            ),
          );
        },
        shrinkWrap: true,
      ),
    );
  }
}
