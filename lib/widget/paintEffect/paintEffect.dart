import 'package:flutter/material.dart';
import './decoratedBox.dart';
import './opacity.dart';

class PaintEffectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaintEffectPage'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: Wrap(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DecoratedBoxPage();
                }));
              },
              child: Text('DecoreatedBox'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OpacityPage();
                }));
              },
              child: Text('Opacity'),
            ),
          ],
        ),
      ),
    );
  }
}
