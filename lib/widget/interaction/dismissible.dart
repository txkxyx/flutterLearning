import 'package:flutter/material.dart';

class DismissiblePage extends StatelessWidget {
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
        title: const Text('Dismissible Page'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.amber,
            ),
            onDismissed: (DismissDirection direction) {
              _items.removeAt(index);
            },
            child: ListTile(title: Text('${_items[index]}'),),
          );
        },
      ),
    );
  }
}
