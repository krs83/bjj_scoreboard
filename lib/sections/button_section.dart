import 'package:bjj_scoreboard/components/buttons/timer_button.dart';
import 'package:flutter/material.dart';

import '../components/buttons/point_button.dart';

class ButtonSection extends StatelessWidget {
  ButtonSection({
    super.key,
    required this.color,
    required this.advText,
    required this.penText,
    required this.score,
    required this.advScore,
    required this.penScore,
    required this.onPositiveCheck,
    required this.onNegativeCheck,
    required this.onAdvAdd,
    required this.onAdvSub,
    required this.onPenAdd,
    required this.onPenSub,
  });

  final Color color;
  final String advText;
  final String penText;
  final int score;
  final int advScore;
  final int penScore;
  final void Function(int score, int index) onPositiveCheck;
  final void Function(int score, int index) onNegativeCheck;
  final void Function(int score) onAdvAdd;
  final void Function(int score) onPenAdd;
  final void Function(int score) onAdvSub;
  final void Function(int score) onPenSub;

  final List<String> pointButtonLabels = ['+1', '+2', '+3', '+4'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: .spaceEvenly,
        children: [
          for (var button in pointButtonLabels.indexed)
            PointButton(
              text: button.$2,
              color: color,
              onPressed: () {
                onPositiveCheck(score, button.$1);
              },
              onLongPress: () {
                onNegativeCheck(score, button.$1);
              },
            ),
          PointButton(
            text: advText,
            onPressed: () {
              onAdvAdd(advScore);
            },
            color: color,
            onLongPress: () {
              onAdvSub(advScore);
            },
          ),
          PointButton(
            text: penText,
            onPressed: () {
              onPenAdd(penScore);
            },
            color: color,
            onLongPress: () {
              onPenSub(penScore);
            },
          ),
          TimerButton(seconds: 10),
        ],
      ),
    );
  }
}
