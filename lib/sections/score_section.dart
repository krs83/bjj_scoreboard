import 'package:flutter/material.dart';

import '../components/fields/score_field.dart';

class ScoreSection extends StatefulWidget {
  const ScoreSection({
    super.key,
    required this.score,
    required this.color,
    required this.advScore,
    required this.penScore,
    required this.athleteName,
  });

  final int score;
  final int advScore;
  final int penScore;
  final Color color;
  final String athleteName;

  @override
  State<ScoreSection> createState() => _ScoreSectionState();
}

class _ScoreSectionState extends State<ScoreSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(10),
        color: widget.color,
      ),
      padding: const .all(6),
      margin: const .all(5),
      child: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Flexible(
            child: Text(
              widget.athleteName,
              textAlign: .center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: .w400,
              ),
            ),
          ),
          Flexible(child: ScoreField(score: widget.score.toString())),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: .all(color: Colors.white),
                  borderRadius: .circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: .only(left: 15, right: 15),
                      child: Text('ADV', style: TextStyle(color: Colors.white)),
                    ),
                    AdvPenScoreField(score: widget.advScore.toString()),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: .all(color: Colors.white),
                  borderRadius: .circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: .only(left: 15, right: 15),
                      child: Text('PEN', style: TextStyle(color: Colors.white)),
                    ),
                    AdvPenScoreField(score: widget.penScore.toString()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
