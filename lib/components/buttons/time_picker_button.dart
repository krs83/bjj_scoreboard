import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/athlete.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePicker();
}

class _TimePicker extends State<TimePicker> {
  final Map<String, int> timePickerMaps = {
    '02:00': 120,
    '03:00': 180,
    '04:00': 240,
    '05:00': 300,
    '06:00': 360,
    '07:00': 420,
    '08:00': 480,
    '09:00': 540,
    '10:00': 600,
  };
  late int timeChoice = timePickerMaps.values.first;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Wrap(
          alignment: .center,
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            for (var button in timePickerMaps.entries)
              ChoiceChip3D(
                style: ChoiceChip3DStyle(
                  topColor: Color(0xFFc12345),
                  backColor: Color(0xFFc45864),
                  borderRadius: BorderRadius.circular(10),
                ),
                onSelected: () => setState(() {
                  timeChoice = button.value;
                  context.read<Athlete>().setTime(seconds: button.value);
                }),
                onUnSelected: () {},
                selected: timeChoice == button.value,
                child: Text(
                  button.key,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
