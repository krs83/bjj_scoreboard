import 'package:bjj_scoreboard/models/score_action.dart';
import 'package:bjj_scoreboard/models/side.dart';

class ScoreHistoryItem {
  const ScoreHistoryItem({
    required this.type,
    required this.side,
    required this.value,
  });

  final ScoreType type;
  final Side side;
  final int value;
}
