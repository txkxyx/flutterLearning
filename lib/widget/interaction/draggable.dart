import 'dart:math';

import 'package:flutter/material.dart';

class DraggablePage extends StatelessWidget {
  var isSuccessful = false;
  final _random = Random();
  final _colors = [Colors.green, Colors.red, Colors.blue];
  @override
  Widget build(BuildContext context) {
    var _color = _colors[_random.nextInt(3)];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Draggable<Color>(
              data: _color,
              child: FlutterLogo(
                size: 100.0,
                colors: _color,
              ),
              feedback: FlutterLogo(
                size: 150.0,
                colors: _color,
              ),
              childWhenDragging: FlutterLogo(
                size: 100.0,
                colors: Colors.green,
              ),
              onDraggableCanceled: (Velocity velocity, Offset offset) {
                isSuccessful = false;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DragTarget(
              builder: (context, List<Color> candidateDate, rejectedDate) {
                return Center(
                  child: isSuccessful
                      ? Container(
                          color: Colors.blue,
                          height: 100.0,
                          width: 100.0,
                          child: Center(
                            child: FlutterLogo(
                              size: 100.0,
                              colors: Colors.green,
                            ),
                          ),
                        )
                      : Container(
                          height: 100.0,
                          width: 100.0,
                          color: Colors.black,
                        ),
                );
              },
              onWillAccept: (Color data) {
                return data == Colors.green;
              },
              onAccept: (Color data) {
                isSuccessful = true;
              },
              onLeave: print,
            )
          ],
        ),
      ),
    );
  }
}
