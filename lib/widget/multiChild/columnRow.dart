import 'package:flutter/material.dart';
import './stack.dart';
import './expanded.dart';
import './flexible.dart';
import 'wrap.dart';
import './table.dart';

class ColumnRowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ColumnRow Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        // width: 100,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 100,
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new MyContainer(40),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StackPage();
                      }));
                    },
                    child: Text('Stack'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ExpandedPage();
                      }));
                    },
                    child: Text('Expanded'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FlexiblePage();
                      }));
                    },
                    child: Text('Flexible'),
                  )
                ],
              ),
            ),
            Container(
                alignment: Alignment.center,
                height: 100,
                color: Colors.green,
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return WrapPage();
                        }));
                      },
                      child: Text('Wrap'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return TablePage();
                        }));
                      },
                      child: Text('Table'),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class MyContainer extends Container {
  double size = 10.0;
  MyContainer(this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: this.size,
      height: this.size,
      color: Colors.black,
    );
  }
}
