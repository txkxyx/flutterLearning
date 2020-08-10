import 'package:flutter/material.dart';

class ReorderableListViewPage extends StatelessWidget {
  var _items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReorderableListView Page'),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          if (newIndex > _items.length) {
            newIndex = _items.length;
          }
          if (oldIndex < newIndex) {
            newIndex--;
          }
          var item = _items[oldIndex];
          _items.remove(item);
          _items.insert(newIndex, item);
        },
        header: const Text('ReorderableListView Page'),
        children: <Widget>[
          for (var item in _items)
            ListTile(
              key: ValueKey(item),
              title: Text(item.toString()),
            )
        ],
      ),
    );
  }
}
