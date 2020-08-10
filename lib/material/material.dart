import 'package:flutter/material.dart';
import 'package:my_app/material/appbar.dart';
import 'package:my_app/material/bottomNavigation.dart';
import 'package:my_app/material/button.dart';
import 'package:my_app/material/drawer.dart';
import 'package:my_app/material/silver.dart';
import 'package:my_app/material/tab.dart';

class MaterialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Page'),
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
                      return AppBarPage();
                    }));
                  },
                  child: const Text('AppBar'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DrawerPage();
                    }));
                  },
                  child: const Text('Drawer'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TabPage();
                    }));
                  },
                  child: const Text('Tab'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BottomNavigationPage();
                    }));
                  },
                  child: const Text('BottomNavigation'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SilverPage();
                    }));
                  },
                  child: const Text('Sliver Page'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ButtonPage();
                    }));
                  },
                  child: const Text('Button Page'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
