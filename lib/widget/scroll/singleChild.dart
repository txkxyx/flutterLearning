import 'package:flutter/material.dart';
import 'package:my_app/widget/multiChild/columnRow.dart';

class SingleChildScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MyContainer(50),
            MyContainer(50),
            MyContainer(50),
            MyContainer(50),
            MyContainer(50),
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
