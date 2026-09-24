import 'package:flutter/material.dart';

class ScoreField extends StatelessWidget {
  const ScoreField({super.key, required this.score});
  final String score;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        fit: .fill,
        child: Text(
          score,
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
      ),
    );
  }
}

class AdvPenScoreField extends StatelessWidget {
  const AdvPenScoreField({super.key, required this.score});
  final String score;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Text(
        score,
        style: TextStyle(color: Colors.white, fontWeight: .normal),
      ),
    );
  }
}
