import 'package:flutter/material.dart';

class FractionallySizedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FractionallySizedBox Page'),
      ),
      body: const Align(
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: 0.75,
            heightFactor: 1,
            child: SizedBox(
              width: 1,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
          )),
    );
  }
}
