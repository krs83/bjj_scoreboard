import 'package:bjj_scoreboard/models/athlete.dart';
import 'package:bjj_scoreboard/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Athlete(),
      child: const BjjScoreboardApp(),
    ),
  );
}

class BjjScoreboardApp extends StatelessWidget {
  const BjjScoreboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SafeArea(child: StartScreen()));
  }
}
