import 'package:flutter/material.dart';

class VsIcon extends StatelessWidget {
  const VsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          'VS',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 10
              ..color = Colors.blueGrey,
          ),
        ),
        const Text(
          'VS',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: Colors.lightBlueAccent,
          ),
        ),
      ],
    );
  }
}
