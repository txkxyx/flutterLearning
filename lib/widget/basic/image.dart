import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Widget Page')),
      body: Column(children: <Widget>[
        Row(
          children: <Widget>[Text('Image.assetコンストラクタ。アプリにバンドルした画像を表示する方法')],
        ),
        Row(
          children: <Widget>[
            // アプリ内の画像を読み込む、パスはpubspec.yamlで指定
            Image.asset(
              'images/flutter.png',
              fit: BoxFit.contain,
            )
          ],
        ),
        Row(
          children: <Widget>[Text('Image.networkはURLの画像を読み込む')],
        ),
        Row(
          children: <Widget>[
            Image.network(
                'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png')
          ],
        ),
        Row(
          children: <Widget>[Text('Image.fileは端末内の画像を読み込む')],
        ),
        // Row(children: <Widget>[Image.file(_pat)],)
        Row(
          children: <Widget>[Text('Image.memoryはバイトから画像を読み込む')],
        )
      ]),
    );
  }
}
