import 'package:flutter/material.dart';

class SizedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SixedBoxPage'),
      ),
      body: const SizedBox(
          // 指定されたサイズのコンテナを作成できる
          // プロパティは, width, height, childのみ
          width: 300,
          height: 300,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.green),
          )),
    );
  }
}
