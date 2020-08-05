import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TextTheme
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final titleStyle = textTheme.title.copyWith(color: theme.backgroundColor);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Widget Page'),
      ),
      body: Column(children: <Widget>[
        // DefaultTextStyle：配下のTextWidgetに対してまとめてスタイルを適用することができる
        DefaultTextStyle(
          style: textTheme.title,
          child: Row(
            children: <Widget>[
              Text('A'),
              Text('B'),
              Text('C'),
            ],
          ),
        ),
        Row(children: <Widget>[
          // 通常のテキスト
          Text(
            'Text Widget Sample',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // RichTextを使用した複数のsytleを適用したテキスト
          Text.rich(TextSpan(text: 'Text.rich()', children: <TextSpan>[
            TextSpan(
                text: 'beautiful',
                style: TextStyle(fontStyle: FontStyle.italic)),
            TextSpan(
                text: 'world', style: TextStyle(fontWeight: FontWeight.bold))
          ])),
        ]),
        Row(
          children: <Widget>[
            // TextThemeを使用したTextWidget
            Text(
              'Text Theme',
              style: titleStyle,
            ),
            Text(
              'Text Style',
              style: textTheme.body1,
            )
          ],
        ),
        Row(
          children: <Widget>[
            // TextのstrutStyle
            // 文字の上のWidgetとの間：leading
            // 文字の部分：ascent
            // 文字の基準：baseline
            // 文字の下部：descent
            // 文字のしたのWidegtとの間；leading
            // height；ascent と　descentをまとめたプロパティ
            Text('StrutStyle',
                strutStyle: StrutStyle(
                  leading: 4.0,
                  height: 3.3,
                ))
          ],
        ),
        Row(
          children: <Widget>[
            // textAlign：文字列の水平方向の位置を指定できる
            // left, right, center, start, end, justify
            Text(
              'text align',
              textAlign: TextAlign.end,
            ),
            // softWrap；文字列の折り返しを指定、デフォルトでtrueで折り返し、falseにする場合はovverflowと組み合わせて使用する
            Text(
              'softWarp',
              softWrap: true,
            ),
            // orverFloe；はみ出した文字列をどうするかを指定する
            // clip, fade, ellipsis, visible
            Text(
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ]),
    );
  }
}
