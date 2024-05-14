import 'package:flutter/material.dart';
import 'package:weather_app/Screens/home_Screen.dart';
import 'package:weather_app/Screens/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true),
      home: LoadingScreen(),
    );
  }
}
