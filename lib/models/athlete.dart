import 'package:flutter/material.dart';

class Athlete extends ChangeNotifier {
  String _blueAthleteName = '';
  String _redAthleteName = '';

  String get blueAthleteName => _blueAthleteName;
  String get redAthleteName => _redAthleteName;

  void setNames({required String blue, required String red}) {
    _blueAthleteName = blue;
    _redAthleteName = red;
    notifyListeners();
  }
}
