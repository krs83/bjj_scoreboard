import 'package:flutter/material.dart';

class Athlete extends ChangeNotifier {
  String _blueAthleteName = '';
  String _redAthleteName = '';
  int _seconds = 300;

  String get blueAthleteName => _blueAthleteName;
  String get redAthleteName => _redAthleteName;
  int get seconds => _seconds;

  void setNames({required String blue, required String red}) {
    _blueAthleteName = blue;
    _redAthleteName = red;
    notifyListeners();
  }

  void setTime({required int seconds}) {
    _seconds = seconds;
    notifyListeners();
  }
}
