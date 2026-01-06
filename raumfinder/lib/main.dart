import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:raumfinder/screens/home_screen.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
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
        fontFamily: 'myriad_pro',
      ),
      home: const RaumfinderHomePage(),
    );
  }
}

