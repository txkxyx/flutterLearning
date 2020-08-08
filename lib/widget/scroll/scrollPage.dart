import 'package:flutter/material.dart';
import 'package:my_app/widget/scroll/gridView.dart';
import 'package:my_app/widget/scroll/pageView.dart';
import 'package:my_app/widget/scroll/singleChild.dart';
import './listView.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scroll Page'),
        ),
        body: Container(
          alignment: Alignment.topLeft,
          child: Wrap(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListViewPage();
                  }));
                },
                child: Text('ListView'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GridViewPage();
                  }));
                },
                child: Text('GridView'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SingleChildScrollViewPage();
                  }));
                },
                child: Text('SingleChildScrollView'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PageViewPage();
                  }));
                },
                child: Text('PageView'),
              ),
            ],
          ),
        ));
  }
}
