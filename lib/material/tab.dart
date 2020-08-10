import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Page'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                icon: Icon(Icons.directions_boat),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.directions_car),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_boat),
          ],
        ),
      ),
    );
  }
}
