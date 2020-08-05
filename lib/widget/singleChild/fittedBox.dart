import 'package:flutter/material.dart';

class FittedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FittedBoxPage'),
      ),
      body: Container(
        width: 400,
        height: 400,
        color: Colors.green,
        child: FittedBox(
          alignment: Alignment.bottomCenter,
          fit: BoxFit.fitHeight,
          child: Image.asset('images/flutter.png'),
        ),
      ),
    );
  }
}
