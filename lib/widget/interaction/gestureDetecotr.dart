import 'package:flutter/material.dart';

class GestureDetectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Detector Pgae'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print('onTap');
                  },
                  child: myContainer('onTap'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Container myContainer(String message) {
  return Container(
    width: 100,
    height: 100,
    color: Colors.yellow,
    child: Text(message),
  );
}
