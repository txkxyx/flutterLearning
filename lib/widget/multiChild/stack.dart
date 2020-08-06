import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Page'),
      ),
      // Widgetを重ねるWidget
      // 配列順に重ねていく
      body: Stack(
        children: <Widget>[
          box('1'),
          // Stackの子要素の配置場所とサイズを指定することができる
          Positioned(
            bottom: 200,
            right: 100,
            height: 100,
            child: box('2', alignment: const Alignment(0.2, 0.2)),
          ),
          box('3', color: Colors.green, alignment: const Alignment(-0.2, -0.2))
        ],
      ),
    );
  }

  Widget box(String number,
      {Color color = Colors.blue, Alignment alignment = Alignment.center}) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: 100,
        height: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(color: color),
          child: Text(
            number,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
