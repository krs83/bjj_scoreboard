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
    required this.onScoreAdd,
    required this.onScoreReduce,
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
  final void Function(int index) onScoreAdd;
  final void Function(int index) onScoreReduce;
  final void Function() onAdvAdd;
  final void Function() onPenAdd;
  final void Function() onAdvSub;
  final void Function() onPenSub;

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
                onScoreAdd(button.$1);
              },
              onLongPress: () {
                onScoreReduce(button.$1);
              },
            ),
          PointButton(
            text: advText,
            onPressed: () {
              onAdvAdd();
            },
            color: color,
            onLongPress: () {
              onAdvSub();
            },
          ),
          PointButton(
            text: penText,
            onPressed: () {
              onPenAdd();
            },
            color: color,
            onLongPress: () {
              onPenSub();
            },
          ),
          TimerButton(seconds: 10),
        ],
      ),
    );
  }
}
