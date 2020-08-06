import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Table(
          // 枠線の設定
          border: TableBorder.all(),
          // 縦方向の余分なスペースを設定
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(children: <Widget>[
              Container(
                color: Colors.black,
                height: 100,
                child: const Text("Column1"),
              ),
              Container(
                color: Colors.blue,
                height: 100,
                child: const Text("Column2"),
              ),
              Container(
                color: Colors.green,
                height: 100,
                child: const Text("Column3"),
              )
            ]),
            TableRow(children: <Widget>[
              Container(
                color: Colors.black,
                height: 100,
                child: const Text("Column1"),
              ),
              Container(
                color: Colors.blue,
                height: 100,
                child: const Text("Column2"),
              ),
              Container(
                color: Colors.green,
                height: 100,
                child: const Text("Column3"),
              )
            ])
          ],
        ),
      ),
    );
  }
}
