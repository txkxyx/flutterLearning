import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            print('leading');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.group),
            onPressed: () {
              print('actions');
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Bottom',style: TextStyle(fontSize: 32),),
          ),
        ),
        elevation: 30,
      ),
    );
  }
}
