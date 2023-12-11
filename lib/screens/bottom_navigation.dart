import 'package:flutter/material.dart';
import 'package:forget_password/screens/home.dart';
import 'package:forget_password/screens/page_any_to_any.dart';
import 'package:forget_password/screens/time_converter.dart';
import 'package:forget_password/styles/colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() =>
      _BottomNavigationState();
}

class _BottomNavigationState
    extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
   Home(),
    PageAnyToAny(),
    TimeConverter(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Open Exchange'),
        backgroundColor: blue,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: 'USD To Any',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Any To Any',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Time Converter',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
