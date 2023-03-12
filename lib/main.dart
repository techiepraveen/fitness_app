import 'package:fitness_app/screens/homepage.dart';
import 'package:fitness_app/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.green,
      home: SplashScreen(),
      routes: {
        '/homepage': (_) => HomePage(),
      },
    );
  }
}
