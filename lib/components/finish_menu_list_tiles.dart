import 'package:flutter/material.dart';

class FinishMenuListTiles extends StatelessWidget {
  const FinishMenuListTiles({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
