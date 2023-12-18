import 'package:flutter/material.dart';
import 'package:forget_password/screens/bottom_navigation.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Open Exchange App',
        theme: ThemeData(
          fontFamily: 'DMSans',
          primaryColor: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: const BottomNavigation());
  }
}
