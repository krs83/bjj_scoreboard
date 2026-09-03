import 'package:bjj_scoreboard/sections/score_section.dart';
import 'package:bjj_scoreboard/sections/upper_section.dart';
import 'package:flutter/material.dart';

import '../components/buttons/point_button.dart';

class MiddleSection extends StatelessWidget {
  const MiddleSection({
    super.key,
    required this.blueScore,
    required this.redScore,
    required this.blueAdvScore,
    required this.redAdvScore,
    required this.bluePenScore,
    required this.redPenScore,
  });

  final int blueScore;
  final int redScore;
  final int blueAdvScore;
  final int redAdvScore;
  final int bluePenScore;
  final int redPenScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UpperSection(),
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
    );
  }
}
