import 'package:flutter/material.dart';
import 'package:forget_password/functions/time_converter.dart';
import 'package:forget_password/screens/bottom_navigation.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TimeConverter())],
      child: MaterialApp(
          title: 'Open Exchange App',
          theme: ThemeData(
            fontFamily: 'DMSans',
            primaryColor: Colors.pink,
          ),
          debugShowCheckedModeBanner: false,
          home: BottomNavigation()),
    );
  }
}
