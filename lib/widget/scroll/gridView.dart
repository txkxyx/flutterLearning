import 'dart:async';

import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  final items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridViewPage'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 16.0,
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        scrollDirection: Axis.vertical,
        primary: true,
        padding: const EdgeInsets.all(32.0),
        children:  gridContainerList(items),
      ),
    );
  }
}

List gridContainerList(List items){
  List result = <Container>[];
  for (var item in items) {
    // ignore: omit_local_variable_types
    Container container = gridContainer(item);
    result.add(container);
  }
  return result;
}

Container gridContainer(String title) {
  return Container(
    alignment: Alignment.center,
    width: 100,
    height: 100,
    color: Colors.green,
    child: Text(title),
  );
}
