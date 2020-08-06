import 'package:flutter/material.dart';

import './columnRow.dart';

class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        width: 100,
        color: Colors.green,
        child: Column(
          children: <Widget>[
            MyContainer(40),
            // Column, Rowウィジェットないで使用すると、余白を埋めるようになる
            // flex:余白の重みを変えることができる
            Expanded(
              child: MyContainer(40),
              flex: 1,
            ),
            Expanded(
              child: MyContainer(40),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
