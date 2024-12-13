import 'package:flutter/material.dart';
import 'package:unisda/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Sabbath',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: const LoginScreen(),
    );
  }
}

class StatelessWidget {}

class ThemeData {}

class Colors {
  static var green;
}
