import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePicker();
}

class _TimePicker extends State<TimePicker> {
  int choiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChoiceChip3D(
            style: ChoiceChip3DStyle.blue,
            onSelected: () => setState(() => choiceIndex = 0),
            onUnSelected: () => null,
            selected: choiceIndex == 0,
            child: Text("Choice One"),
          ),
          ChoiceChip3D(
            style: ChoiceChip3DStyle.blue,
            onSelected: () => setState(() => choiceIndex = 1),
            onUnSelected: () => null,
            selected: choiceIndex == 1,
            child: Text("Choice Two"),
          ),
        ],
      ),
    );
  }
}
