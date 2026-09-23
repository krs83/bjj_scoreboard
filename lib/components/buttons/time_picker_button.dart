import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePicker();
}

class _TimePicker extends State<TimePicker> {
  int choiceIndex = 0;
  final List<String> timePickerLabels = [
    // '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
  ];

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
            for (var button in timePickerLabels.indexed)
              ChoiceChip3D(
                style: ChoiceChip3DStyle(
                  topColor: Color(0xFFc12345),
                  backColor: Color(0xFFc45864),
                  borderRadius: BorderRadius.circular(10),
                ),
                onSelected: () => setState(() => choiceIndex = button.$1),
                onUnSelected: () {},
                selected: choiceIndex == button.$1,
                child: Text(
                  button.$2,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
