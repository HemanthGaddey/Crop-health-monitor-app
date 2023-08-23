import 'package:flutter/material.dart';
import 'package:prac/pages/intro_screen.dart';
import 'package:prac/pages/login_screen.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'practise',
      theme: ThemeData(),
      home: const IntroScreen(),
    );
  }
}
