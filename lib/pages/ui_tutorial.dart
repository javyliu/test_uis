import 'package:flutter/material.dart';
import 'package:test_uis/widges/widget_parent.dart';
import 'package:test_uis/widges/widget_tapbox.dart';
import 'package:test_uis/widges/widgit_favorite.dart';

class UiTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Oeschinen Lake Campground",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kandersteg, Switzerland",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                )
              ],
            ),
          ),
          WigetFavorate(),
          // Icon(Icons.star, color: Colors.red[500]),
          // Text('41')
        ],
      ),
    );

    Column _buildButtomColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color)),
          )
        ],
      );
    }

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtomColumn(color, Icons.call, 'CALL'),
          _buildButtomColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtomColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese'
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a'
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        // textAlign: TextAlign.justify,
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Layout Tutorial")),
      body: ListView(
        children: <Widget>[
          Image.asset('images/lake.jpg', width: 600, height: 240, fit: BoxFit.cover, ),
          titleSection,
          buttonSection,
          textSection,
          TapboxA(),
          WidgetParent(),
        ],
      ),
    );
  }
}
