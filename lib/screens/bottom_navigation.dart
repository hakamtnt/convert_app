import 'package:flutter/material.dart';
import 'package:forget_password/screens/home.dart';
import 'package:forget_password/screens/page_any_to_any.dart';
import 'package:forget_password/styles/colors.dart';
import 'package:forget_password/widgets/app_drawer.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const PageAnyToAny(),
    const Text('data'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyAppDrawer(),
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
            icon: Icon(Icons.person_2),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
