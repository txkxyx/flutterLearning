import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DecoratedBox Page'),
      ),
      body: SizedBox(
        width: 100,
        height: 100,
        child: DecoratedBox(
          // BoxDecorationオブジェクトを渡す
          decoration: BoxDecoration(color: Colors.green),
          // 前面か後面に配置するかを指定する
          position: DecorationPosition.background,
        ),
      ),
    );
  }
}
