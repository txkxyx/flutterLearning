import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  var _isSelected = [false, true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('tap')));
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Flat Button'),
                  ),
                )
              ],
            ),
            Wrap(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    print('RaisedButton');
                  },
                  child: Text('Raised Button'),
                ),
                FlatButton(
                  onPressed: () {
                    print('Flat Button');
                  },
                  child: Text('Flat Button'),
                ),
                OutlineButton(
                  onPressed: () {
                    print('Outline Button');
                  },
                  child: Text('Outline Button'),
                ),
              ],
            ),
            Wrap(
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.thumb_up,
                    semanticLabel: 'Thumbs Up',
                  ),
                  onPressed: () {
                    print('Icon Button');
                  },
                  color: Colors.blue,
                ),
              ],
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('Button1'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Button2'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Button3'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Button4'),
                )
              ],
            ),
            Wrap(children: <Widget>[
              ToggleButtons(isSelected: _isSelected,
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
              onPressed: (int index){
                for(int buttonIndex; buttonIndex < _isSelected.length; buttonIndex ++){
                  if(buttonIndex == index){
                    _isSelected[buttonIndex] = true;
                  }else{
                    _isSelected[buttonIndex] = false;
                  }
                }
              },)
            ],)
          ],
        ),
      ),
    );
  }
}
