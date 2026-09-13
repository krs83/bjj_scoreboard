import 'package:bjj_scoreboard/models/score_action.dart';
import 'package:bjj_scoreboard/models/score_history_item.dart';
import 'package:flutter/material.dart';

import '../models/side.dart';
import '../sections/button_section.dart';
import '../sections/middle_section.dart';

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
  List<ScoreHistoryItem> scoreHistory = [];

  //blue scores
  void _addBlueScore(int index, {bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(
            type: ScoreType.addScore,
            side: Side.blue,
            value: index,
          ),
        );
      }
      if (blueScore < 99) {
        blueScore += index + 1;
      }
      if (blueScore > 99) {
        blueScore = 99;
      }
    });
  }

  void _reduceBlueScore(int index, {bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(
            type: ScoreType.reduceScore,
            side: Side.blue,
            value: index,
          ),
        );
      }
      if (blueScore > 0) {
        blueScore -= index + 1;
      }
      if (blueScore < 0) {
        blueScore = 0;
      }
    });
  }

  void _addBlueAdvScore({bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(type: ScoreType.addAdv, side: Side.blue, value: 1),
        );
      }
      if (blueAdvScore < 99) {
        blueAdvScore++;
      }
    });
  }

  void _reduceBlueAdvScore({bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(
            type: ScoreType.reduceAdv,
            side: Side.blue,
            value: 1,
          ),
        );
      }
      if (blueAdvScore > 0) {
        blueAdvScore--;
      }
    });
  }

  void _addBluePenScore({bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(type: ScoreType.addPen, side: Side.blue, value: 1),
        );
      }
      if (bluePenScore < 99) {
        bluePenScore++;
      }
    });
  }

  void _reduceBluePenScore({bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(
            type: ScoreType.reducePen,
            side: Side.blue,
            value: 1,
          ),
        );
      }
      if (bluePenScore > 0) {
        bluePenScore--;
      }
    });
  }

  //red scores
  void _addRedScore(int index, {bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(
            type: ScoreType.addScore,
            side: Side.red,
            value: index,
          ),
        );
      }
      if (redScore < 99) {
        redScore += index + 1;
      }
      if (redScore > 99) {
        redScore = 99;
      }
    });
  }

  void _reduceRedScore(int index, {bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(
            type: ScoreType.reduceScore,
            side: Side.red,
            value: index,
          ),
        );
      }
      if (redScore > 0) {
        redScore -= index + 1;
      }
      if (redScore < 0) {
        redScore = 0;
      }
    });
  }

  void _addRedAdvScore({bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(type: ScoreType.addAdv, side: Side.red, value: 1),
        );
      }
      if (redAdvScore < 99) {
        redAdvScore++;
      }
    });
  }

  void _reduceRedAdvScore({bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(type: ScoreType.reduceAdv, side: Side.red, value: 1),
        );
      }
      if (redAdvScore > 0) {
        redAdvScore--;
      }
    });
  }

  void _addRedPenScore({bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(type: ScoreType.addPen, side: Side.red, value: 1),
        );
      }
      if (redPenScore < 99) {
        redPenScore++;
      }
    });
  }

  void _reduceRedPenScore({bool isUndo = false}) {
    setState(() {
      if (!isUndo) {
        scoreHistory.add(
          ScoreHistoryItem(type: ScoreType.reducePen, side: Side.red, value: 1),
        );
      }
      if (redPenScore > 0) {
        redPenScore--;
      }
    });
  }

  void _doublePenalty({bool isUndo = false}) {
    setState(() {
      // scoreHistory.add(12);
      redPenScore++;
      bluePenScore++;
    });
  }

  void _undoScore() {
    if (scoreHistory.isEmpty) return;

    final last = scoreHistory.removeLast();
    final points = last.value;

    setState(() {
      final isBlue = last.side == Side.blue;

      switch (last.type) {
        case ScoreType.addScore:
          isBlue
              ? _reduceBlueScore(points, isUndo: true)
              : _reduceRedScore(points, isUndo: true);
        case ScoreType.reduceScore:
          isBlue
              ? _addBlueScore(points, isUndo: true)
              : _addRedScore(points, isUndo: true);
        case ScoreType.addAdv:
          isBlue
              ? _reduceBlueAdvScore(isUndo: true)
              : _reduceRedAdvScore(isUndo: true);
        case ScoreType.reduceAdv:
          isBlue
              ? _addBlueAdvScore(isUndo: true)
              : _addRedAdvScore(isUndo: true);
        case ScoreType.addPen:
          isBlue
              ? _reduceBluePenScore(isUndo: true)
              : _reduceRedPenScore(isUndo: true);
        case ScoreType.reducePen:
          isBlue
              ? _addBluePenScore(isUndo: true)
              : _addRedPenScore(isUndo: true);
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
          onScoreAdd: _addBlueScore,
          onScoreReduce: _reduceBlueScore,
          onAdvAdd: _addBlueAdvScore,
          onPenAdd: _addBluePenScore,
          onAdvSub: _reduceBlueAdvScore,
          onPenSub: _reduceBluePenScore,
        ),
        Expanded(
          child: MiddleSection(
            blueScore: blueScore,
            redScore: redScore,
            blueAdvScore: blueAdvScore,
            redAdvScore: redAdvScore,
            bluePenScore: bluePenScore,
            redPenScore: redPenScore,
            onDoublePenScore: _doublePenalty,
            onUndo: _undoScore,
          ),
        ),
        ButtonSection(
          color: Color(0xFFc92236),
          advText: 'ADV',
          penText: 'PEN',
          score: redScore,
          advScore: redAdvScore,
          penScore: redPenScore,
          onScoreAdd: _addRedScore,
          onScoreReduce: _reduceRedScore,
          onAdvAdd: _addRedAdvScore,
          onPenAdd: _addRedPenScore,
          onAdvSub: _reduceRedAdvScore,
          onPenSub: _reduceRedPenScore,
        ),
      ],
    );
  }
}
