import 'package:flutter/material.dart';

class SilverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('SliverAppBar'),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[Image.asset('images/flutter.png')],
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
              );
            }, childCount: 30),
          )
        ],
      ),
    );
  }
}
