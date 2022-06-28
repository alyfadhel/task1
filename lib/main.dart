import 'package:flutter/material.dart';
import 'package:task1/on_boarding/on_boarding_screen.dart';
import 'package:task1/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const OnBoardingScreen(),
    );
  }
}


