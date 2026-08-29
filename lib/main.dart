import 'package:flutter/material.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(const BjjScoreboardApp());
}

class BjjScoreboardApp extends StatelessWidget {
  const BjjScoreboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(backgroundColor: Color(0xFF15262b), body: MainScreen()),
      ),
    );
  }
}
