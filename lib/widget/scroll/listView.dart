import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  final items = ['1', '2', '3', '4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Page'),
      ),
      body: 
      // ListView(
      //   children: const <Widget>[
      //     ListTile(
      //       title: Text("1"),
      //     ),
      //     ListTile(
      //       title: Text("2"),
      //     ),
      //     ListTile(
      //       title: Text("3"),
      //     )
      //   ],
      // ),
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      )
    );
  }
}
