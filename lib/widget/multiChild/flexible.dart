import 'package:flutter/material.dart';

class FlexiblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 400,
        // height: 100,
        child: Column(
          children: <Widget>[
            // 親要素のサイズに応じて
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.cyan,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.green,
              ),
            ),
            Container(
              color: Colors.pink,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
