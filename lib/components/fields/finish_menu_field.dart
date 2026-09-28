import 'package:flutter/material.dart';

import '../finish_menu_list_tiles.dart';

class FinishMenuField extends StatelessWidget {
  const FinishMenuField({super.key, required this.left, required this.right});

  final double top = 74;
  final double bottom = 4;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20),
        ),

        child: ListView(
          children: [
            FinishMenuListTiles(title: 'Scores'),
            FinishMenuListTiles(title: 'Submission'),
            FinishMenuListTiles(title: 'Walkover'),
            FinishMenuListTiles(title: 'Disqualification'),
            FinishMenuListTiles(title: 'EXIT'),
          ],
        ),
      ),
    );
  }
}
