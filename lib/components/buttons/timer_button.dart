import 'package:audioplayers/audioplayers.dart';
import 'package:bjj_scoreboard/constants.dart';
import 'package:chronograph/chronograph.dart';
import 'package:flutter/material.dart';

class TimerButton extends StatefulWidget {
  const TimerButton({
    super.key,
    required this.seconds,
    this.title = 'STALLING',
    this.width = 120,
    this.height = 70,
    this.size = 32,
    this.isTitle = true,
    this.isMainTimer = true,
  });

  final int seconds;
  final String title;
  final double width;
  final double height;
  final double size;
  final bool isTitle;
  final bool isMainTimer;

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  late final timer = ChronoGraph.timer(
    duration: Duration(seconds: widget.seconds),
    autostart: false,
    onCompleted: _timerReset,
  );
  final player = AudioPlayer();

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void _toggleTimer() {
    if (!timer.value.running) {
      timer.start();
    } else {
      timer.pause();
    }
  }

  void _timerReset() {
    setState(() {
      if (widget.isMainTimer) {
        player.play(AssetSource('finish-gong.mp3'));
      }
      timer.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    Color timeColor = kWhite;

    return GestureDetector(
      onTap: () {
        setState(() {
          _toggleTimer();
          if (timer.value.running & widget.isMainTimer) {
            player.play(AssetSource('start-sound.mp3'));
          }
        });
      },
      onLongPress: () {
        setState(() {
          timer.reset();
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF25262a),
        ),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.isTitle)
                Text(
                  widget.title,
                  style: TextStyle(
                    color: kYellowTimer,
                    fontSize: 10,
                    letterSpacing: 2,
                  ),
                ),
              ChronoView(
                graph: timer,
                builder: (context, info, _) {
                  if (widget.isMainTimer) {
                    if (info.inSeconds < 6) {
                      timeColor = Color(0xFFCD5C5C);
                    }
                  }
                  return Text(
                    '${info.paddedMinutes}:${info.paddedSeconds}',
                    style: TextStyle(
                      color: !timer.value.running ? kYellowTimer : timeColor,
                      fontSize: widget.size,
                      fontFamily: 'Roboto',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.dispose();
    super.dispose();
  }
}
