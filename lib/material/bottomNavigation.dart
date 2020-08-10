import 'package:flutter/material.dart';

class BottomNavigationPage extends StatelessWidget {
  int _selectedIndex = 0;
  static const List<Widget> _widgets = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigation Page'),
      ),
      body: Center(
        child: _widgets.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Bussiness')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('Schoole')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
