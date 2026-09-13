import 'package:flutter/material.dart';

import '../components/buttons/point_button.dart';
import '../components/buttons/timer_button.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({super.key, required this.onUndo});

  final void Function() onUndo;

  @override
  Widget build(BuildContext context) {
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
        TimerButton(seconds: 300, width: 200, size: 40, isTitle: false),
        Expanded(
          child: PointButton(
            text: 'FINISH',
            onPressed: () {},
            onLongPress: () {},
            color: Colors.lightGreen,
          ),
        ),
      ],
    );
  }
}
