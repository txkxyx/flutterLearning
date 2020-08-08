import 'package:flutter/material.dart';

import '../multiChild/columnRow.dart';

class OpacityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity Page'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: Wrap(
          children: <Widget>[
            MyContainer(50),
            // 透過度を指定する
            // 0.0(透明)〜1.0(表示)
            Opacity(
              opacity: 0.5,
              child: MyContainer(50),
            ),
            AnimatedOpacity(
              duration: Duration(seconds: 10),
              opacity: 0.0,
              child: MyContainer(50),
            ),
            MyContainer(50)
          ],
        ),
      ),
    );
  }
}
