import 'package:flutter/material.dart';
import 'package:raumfinder/screens/home.dart';

void main() {
  runApp(const UzLRaumfinderApp());
}

class UzLRaumfinderApp extends StatelessWidget {
  const UzLRaumfinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UzL Raumfinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Roboto',
      ),
      home: const RaumfinderHomePage(),
    );
  }
}

