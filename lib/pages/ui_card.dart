import 'package:flutter/material.dart';

class UiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card sample'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(
                      Icons.access_alarm,
                      size: 50,
                    ),
                    title: Text("卡片标题，这个地方的字体较大1"),
                    subtitle: Text("此处是二级标题，字体是灰色的，字号应该是一样大此处是二级标题，字体是灰色的，字号应该是一样大"),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('买票'),
                        onPressed: () => print("买票"),
                      ),
                      FlatButton(
                        child: const Text('列表'),
                        onPressed: () => print("显示列表"),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Card(
              child: InkWell(
                child: Container(
                  width: double.infinity,
                  // height: 100,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text("可被点击的卡片"),
                      Material(
                        child: Chip(
                          //chip 的父组件必段是 Material, MediaQuery, Directionality and MaterialLocalizations
                          backgroundColor: Colors.blue[200],
                          avatar: CircleAvatar(
                            backgroundColor: Colors.grey.shade800,
                            child: Text("AB"),
                          ),
                          label: Text("Aaron Burr"),
                        ),
                      ),
                      InputChip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.grey.shade800,
                          child: Text("AB"),
                        ),
                        label: Text('Aaron Burr'),
                        onPressed: () => print("I am the one thing in life"),
                      ),
                    ],
                  ),
                ),
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print("Card Tapped");
                },
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[UiOptions()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UiOptions extends StatefulWidget {
  @override
  _UiOptionsState createState() => _UiOptionsState();
}

class _UiOptionsState extends State<UiOptions> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(3, (index) {
        return ChoiceChip(
          avatar: CircleAvatar(
            backgroundColor: Colors.black26,
            child: Text("Q$index"),
          ),
          selectedColor: Colors.purple,
          label: Text("Item $index"),
          selected: _value == index,
          labelStyle: _value == index ? TextStyle(color: Colors.white) : TextStyle(color: Colors.red),
          onSelected: (selected) {
            print("----$index---$selected--");
            setState(() {
              _value = selected ? index : null;
            });
          },
        );
      }).toList(),
    );
  }
}
