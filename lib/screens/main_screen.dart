import 'package:bjj_scoreboard/components/point_button.dart';
import 'package:bjj_scoreboard/components/timer_button.dart';
import 'package:flutter/material.dart';

import '../sections/button_section.dart';
import '../sections/score_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int blueScore = 0;
  int redScore = 0;
  int redAdvScore = 0;
  int blueAdvScore = 0;
  int redPenScore = 0;
  int bluePenScore = 0;

  //blue scores
  void _checkBluePositiveScore(int score, int index) {
    setState(() {
      if (blueScore < 99) {
        blueScore += index + 1;
      }
      if (blueScore > 99) {
        blueScore = 99;
      }
    });
  }

  void _checkBlueNegativeScore(int score, int index) {
    setState(() {
      if (blueScore > 0) {
        blueScore -= index + 1;
      }
      if (blueScore < 0) {
        blueScore = 0;
      }
    });
  }

  void _addBlueAdvScore(int score) {
    setState(() {
      if (blueAdvScore < 99) {
        blueAdvScore++;
      }
    });
  }

  void _reduceBlueAdvScore(int score) {
    setState(() {
      if (blueAdvScore > 0) {
        blueAdvScore--;
      }
    });
  }

  void _addBluePenScore(int score) {
    setState(() {
      if (bluePenScore < 99) {
        bluePenScore++;
      }
    });
  }

  void _reduceBluePenScore(int score) {
    setState(() {
      if (bluePenScore > 0) {
        bluePenScore--;
      }
    });
  }

  //red scores
  void _checkRedPositiveScore(int score, int index) {
    setState(() {
      if (redScore < 99) {
        redScore += index + 1;
      }
      if (redScore > 99) {
        redScore = 99;
      }
    });
  }

  void _checkRedNegativeScore(int score, int index) {
    setState(() {
      if (redScore > 0) {
        redScore -= index + 1;
      }
      if (redScore < 0) {
        redScore = 0;
      }
    });
  }

  void _addRedAdvScore(int score) {
    setState(() {
      if (redAdvScore < 99) {
        redAdvScore++;
      }
    });
  }

  void _reduceRedAdvScore(int score) {
    setState(() {
      if (redAdvScore > 0) {
        redAdvScore--;
      }
    });
  }

  void _addRedPenScore(int score) {
    setState(() {
      if (redPenScore < 99) {
        redPenScore++;
      }
    });
  }

  void _reduceRedPenScore(int score) {
    setState(() {
      if (redPenScore > 0) {
        redPenScore--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonSection(
          color: Color(0xFF153fa1),
          advText: 'ADV',
          penText: 'PEN',
          score: blueScore,
          advScore: blueAdvScore,
          penScore: bluePenScore,
          onPositiveCheck: _checkBluePositiveScore,
          onNegativeCheck: _checkBlueNegativeScore,
          onAdvAdd: _addBlueAdvScore,
          onPenAdd: _addBluePenScore,
          onAdvSub: _reduceBlueAdvScore,
          onPenSub: _reduceBluePenScore,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: PointButton(
                      text: 'UNDO',
                      onPressed: () {},
                      onLongPress: () {},
                      color: Colors.lightGreen,
                    ),
                  ),
                  TimerButton(
                    seconds: 300,
                    width: 200,
                    size: 40,
                    isTitle: false,
                  ),
                  Expanded(
                    child: PointButton(
                      text: 'FINISH',
                      onPressed: () {},
                      onLongPress: () {},
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  alignment: .center,
                  children: [
                    Positioned.fill(
                      child: Row(
                        children: [
                          Expanded(
                            child: ScoreSection(
                              score: blueScore,
                              color: Color(0xFF153fa1),
                              advScore: blueAdvScore,
                              penScore: bluePenScore,
                            ),
                          ),
                          Expanded(
                            child: ScoreSection(
                              score: redScore,
                              color: Color(0xFFc92236),
                              advScore: redAdvScore,
                              penScore: redPenScore,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 63,
                      child: PointButton(
                        text: 'DOUBLE STALLING',
                        size: 10,
                        onPressed: () {},
                        onLongPress: () {},
                        color: Color(0xFFfbbb15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ButtonSection(
          color: Color(0xFFc92236),
          advText: 'ADV',
          penText: 'PEN',
          score: redScore,
          advScore: redAdvScore,
          penScore: redPenScore,
          onPositiveCheck: _checkRedPositiveScore,
          onNegativeCheck: _checkRedNegativeScore,
          onAdvAdd: _addRedAdvScore,
          onPenAdd: _addRedPenScore,
          onAdvSub: _reduceRedAdvScore,
          onPenSub: _reduceRedPenScore,
        ),
      ],
    );
  }
}
