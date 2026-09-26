import 'package:bjj_scoreboard/models/athlete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/buttons/point_button.dart';
import '../components/buttons/timer_button.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
    required this.onUndo,
    required this.onFinishMenu,
  });

  final void Function() onUndo;
  final void Function() onFinishMenu;

  @override
  Widget build(BuildContext context) {
    final timeSeconds = context.watch<Athlete>().seconds;

    return Row(
      children: [
        Expanded(
          child: PointButton(
            text: 'UNDO',
            onPressed: () {},
            onLongPress: onUndo,
            color: Colors.blueGrey,
          ),
        ),
        TimerButton(seconds: timeSeconds, width: 200, size: 40, isTitle: false),
        Expanded(
          child: PointButton(
            text: 'FINISH',
            onPressed: () {
              onFinishMenu();
            },
            onLongPress: () {},
            color: Colors.lightGreen,
          ),
        ),
      ],
    );
  }
}
