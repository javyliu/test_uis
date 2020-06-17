import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UiFlutterSlidable extends StatefulWidget {
  @override
  _UiFlutterSlidableState createState() => _UiFlutterSlidableState();
}

class _UiFlutterSlidableState extends State<UiFlutterSlidable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: Material(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Text("\$3"),
                foregroundColor: Colors.white,
              ),
              title: Text("Tile n\$3"),
              subtitle: Text("SlidableDrawerDelegate"),
            ),
          ),
        ),
        actions: <Widget>[
          IconSlideAction(
            caption: 'Archive',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: () => print("click Archive"),
          ),
          IconSlideAction(
            caption: "Share",
            color: Colors.indigo,
            icon: Icons.share,
            onTap: () => print("click share"),
          )
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: "More",
            color: Colors.black45,
            icon: Icons.more_horiz,
            onTap: () => print("click more"),
          ),
          IconSlideAction(
            caption: "Delete",
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => print("click Delete"),
          )
        ],
      ),
    );
  }
}
