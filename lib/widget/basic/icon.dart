import 'package:flutter/material.dart';

class IconPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Widget Page'),
      ),
      body: Center(
        child: Icon(
          Icons.insert_emoticon,
          color: Colors.blue,
          size: 30.0,
        ),
      ),
    );
  }
}
