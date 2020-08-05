import 'package:flutter/material.dart';

class AlignCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align Cneter Widget'),
      ),
      body: const Align(
        // alignment: Alignment.bottomRight,
        alignment: Alignment(-1.0, 1.0),
        child: SizedBox(
          width: 50,
          height: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
