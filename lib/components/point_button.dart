import 'package:flutter/material.dart';

class PointButton extends StatelessWidget {
  const PointButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.onLongPress,
    required this.color,
    this.size = 20,
  });
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(borderRadius: .circular(10), color: color),
        padding: const .all(6),
        margin: .all(5),
        child: Text(
          text,
          textAlign: .center,
          style: TextStyle(
            color: Colors.white,
            fontSize: size,
            fontWeight: .bold,
          ),
        ),
      ),
    );
  }
}
