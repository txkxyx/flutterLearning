import 'package:flutter/material.dart';

class ConstrainedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConstraindeBox'),
      ),
      // childのコンテナに対して制約を持たすことができる
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 100),
        child: SizedBox(
          width: 300,
          height: 300,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
