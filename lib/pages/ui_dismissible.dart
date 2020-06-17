import 'package:flutter/material.dart';

class UiDismissible extends StatelessWidget {
  final List _items = ["主标题1", "是否可以删除呢？", "为什么左右的图标有问题"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可删除组件"),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, idx) {
          return Dismissible(
            confirmDismiss: (DismissDirection direction) async {
              return await _dialog(context,direction);
            },
            child: Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12, width: 1, style: BorderStyle.solid))),
              child: ListTile(
                leading: Icon(Icons.accessible_forward),
                subtitle: Text("副标题"),
                title: Text(_items[idx]),
                // dense: true,
                // isThreeLine: true,
              ),
            ),
            key: ValueKey(_items[idx]),
            onDismissed: (direction) {
              print("----------$direction-----");
              _items.removeAt(idx);
            },
            background: Container(
              color: Colors.green,
              child: Icon(Icons.check),
            ),
            secondaryBackground: Container(
              color: Colors.red[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text(
                      "请选择。。。",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.delete,
                      color: Colors.red[300],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.remove, color: Colors.green[300]),
                  ),
                ],
              ),
            ),
          );
        },
        shrinkWrap: true,
      ),
      // body: Container(
      //     child: ListView(
      //   children: _items.map((item) {
      //     return Dismissible(
      //       child: Text(item),
      //       onDismissed: (direction) {
      //         _items.remove(item);
      //       },
      //       background: Container(color: Colors.green),
      //       key: ValueKey(item),
      //     );
      //   }).toList(),
      // )),
    );
  }

  Future<bool> _dialog(BuildContext context,DismissDirection direction) {
    switch (direction) {
      case DismissDirection.endToStart:
        print("从右往左");        
        break;
      case DismissDirection.startToEnd:
        print("从左到右");
        break;
      default:
        print("方向不对");
    }
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("确定要删除该项么？"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("确定删除"),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("取消"),
            ),
          ],
        );
      },
    );
  }
}
