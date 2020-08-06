import 'package:flutter/material.dart';
import 'boxDecoration.dart';
import 'sizedBox.dart';
import 'alignCenter.dart';
import 'fractionallySizedBox.dart';
import 'constrainedBox.dart';
import 'fittedBox.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Container Page'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: Container(
                color: Colors.red,
                width: 50,
                height: 50,
                transform: Matrix4.rotationZ(0.1),
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BoxDecorationPage();
                    }));
                  },
                  child: Text('BoxDecoration'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SizedBoxPage();
                    }));
                  },
                  child: Text('SizedBoxPage'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AlignCenterPage();
                    }));
                  },
                  child: Text('AlignCenterPage'),
                )
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FractionallySizedBoxPage();
                    }));
                  },
                  child: Text('Fractionally'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ConstrainedBoxPage();
                    }));
                  },
                  child: Text('ConstrainedBox'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FittedBoxPage();
                    }));
                  },
                  child: Text('FittedBox'),
                )
              ],
            )
          ],
        ));
  }
}
