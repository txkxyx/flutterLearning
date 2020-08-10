import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Page'),
      ),
      drawer: Drawer(
          child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(color: Colors.blue),
        child: Text('drawer'),
      )),
      endDrawer: Drawer(),
    );
  }
}
