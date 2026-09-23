import 'package:bjj_scoreboard/components/buttons/time_picker_button.dart';
import 'package:bjj_scoreboard/components/vs_icon.dart';
import 'package:bjj_scoreboard/constants.dart';
import 'package:bjj_scoreboard/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../components/fields/name_input_field.dart';
import '../models/athlete.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final TextEditingController blueController = TextEditingController();
  final TextEditingController redController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF15262b),
      body: Column(
        children: [
          NameInputField(
            fieldName: 'Соперник 1',
            color: kRedSection,
            controller: blueController,
          ),
          VsIcon(),
          NameInputField(
            fieldName: 'Соперник 2',
            color: kBlueSection,
            controller: redController,
          ),
          SizedBox(height: 15),
          TimePicker(),
          ElevatedButton(
            onPressed: () {
              context.read<Athlete>().setNames(
                blue: blueController.text,
                red: redController.text,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MainScreen()),
              );
            },
            child: Text('Новая схватка'),
          ),
        ],
      ),
    );
  }
}
