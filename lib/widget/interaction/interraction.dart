import 'package:flutter/material.dart';
import 'package:my_app/widget/interaction/dismissible.dart';
import 'package:my_app/widget/interaction/draggable.dart';
import 'package:my_app/widget/interaction/gestureDetecotr.dart';
import 'package:my_app/widget/interaction/reorderableListView.dart';

class InteractionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interaction Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GestureDetectorPage();
                    }));
                  },
                  child: Text('GestureDector'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ReorderableListViewPage();
                    }));
                  },
                  child: Text('ReorderableListView'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DismissiblePage();
                    }));
                  },
                  child: Text('DismissiblePgae'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DraggablePage();
                    }));
                  },
                  child: Text('Draggable Page'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
