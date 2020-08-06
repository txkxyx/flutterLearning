import 'package:flutter/material.dart';
import './columnRow.dart';

class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        // Rowの改行してくれる版
        child: Wrap(
          // 配列方法
          // verticla: 縦
          // horizontal: 横
          direction: Axis.vertical,
          // 配置開始
          alignment: WrapAlignment.end,
          // 各要素の間隔
          spacing: 0.5,
          children: <Widget>[
            MyContainer(50),
            MyContainer(50),
            MyContainer(50),
            MyContainer(50),
            MyContainer(50),
            MyContainer(50),
            MyContainer(50),
            MyContainer(50),
          ],
        ),
      ),
    );
  }
}
