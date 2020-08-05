import 'package:flutter/material.dart';

class BoxDecorationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BoxDecoration'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              // コンテナの色
              color: Colors.green,
              // コンテナの形
              shape: BoxShape.circle,
              // 背景の影
              boxShadow: const [BoxShadow(blurRadius: 10)],
              // グラデーション
              // LinerGrant: リストの初めから左から右にグラデーションが始まる
              // gradient: LinearGradient(colors: [
              //   Colors.yellowAccent,
              //   Colors.black
              // ])
              // RadialGradient: リストの初めから真ん中から外側にグラデーションが始まる
              // gradient: RadialGradient(colors: [
              //   Colors.yellowAccent,
              //   Colors.black
              // ]),
              // SweepGradient : リストの初めから時計回りにグラデーションが始まる
              gradient:
                  SweepGradient(colors: [Colors.yellowAccent, Colors.black]),
              // 画像
              image: DecorationImage(image: AssetImage('images/flutter.png'))
              // 輪郭
              // borderRadius: BorderRadius.circular(100),
              // 枠線
              // border: Border.all(width: 10.0, color: Colors.red)
              ),
        ),
      ),
    );
  }
}
