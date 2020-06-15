import 'package:flutter/material.dart';

class UiDismissible extends StatelessWidget {
  final List _items = ["主标题1", "是否可以删除呢？", "为什么左右的图标有问题"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可删除组件"),
      ),
      body: ListView.separated(
        itemCount: _items.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, idx) {
          return Container(
            color: Colors.blue[100],
            child: Dismissible(
              child: ListTile(
                leading: Icon(Icons.accessible_forward),
                subtitle: Text("副标题"),
                title: Text(_items[idx]),
                // dense: true,
                // isThreeLine: true,
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
                color: Colors.red,
                child: Icon(Icons.cancel),
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
}
