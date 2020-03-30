import 'package:flutter/material.dart';
import 'package:teacher_assistant/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher Assistant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff3399FF),
        accentColor: Color(0xFF3399FF),
      ),
      home: HomeScreen(),
    );
  }
}
