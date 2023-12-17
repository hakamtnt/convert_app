import 'package:flutter/material.dart';
import 'package:forget_password/screens/time_converter.dart';

import '../Styles/colors.dart';
import '../screens/bottom_navigation.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Slect Converter'),
          backgroundColor: blue,
        ),
        body: Column(
          children: [
            ListTile(
              title: const Text(
                'Time Converter',
              ),
              leading: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext) => MyTimeConverter()),
                );
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                'Currency Converter',
              ),
              leading: Icon(
                Icons.currency_exchange,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext) => BottomNavigation()),
                );
              },
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
