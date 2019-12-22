import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
int initialMinutes = 24;
int initialSeconds = 60;
String time = '25:00';
var duration = const Duration(seconds: 1);
var watch = Stopwatch();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      home: PomodoroTimer(),
    );
  }
}

class PomodoroTimerState extends State<PomodoroTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro Timer'),
      ),
      body: _buildPomodoroTimer(),
    );
  }

  void _onPressed() {
    if (_isPlaying()) {
      watch.stop();
    }

    _startStopwatch();
  }

  bool _isPlaying() {
    return watch.isRunning;
  }

  Widget _buildPomodoroTimer() {
    return Center(
        child: Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: stopwatch(),
        ),
        Placeholder(),
        IconButton(
            icon: _isPlaying() ? Icon(Icons.stop) : Icon(Icons.play_arrow),
            onPressed: _onPressed),
      ],
    ));
  }

  void _startStopwatch() {
    watch.start();
    _startTimer();
  }

  void _startTimer() {
    Timer(duration, _keepRunning);
  }

  void _keepRunning() {
    if (watch.isRunning) {
      _startTimer();
    }

    setState(() {
      int currentMinute =
          int.parse(watch.elapsed.inMinutes.toString().padLeft(2, '0'));
      int currentSeconds =
          int.parse((watch.elapsed.inSeconds % 60).toString().padLeft(2, '0'));

      time = (initialMinutes - currentMinute).toString() +
          ":" +
          (initialSeconds - currentSeconds).toString();
    });
  }
}

class PomodoroTimer extends StatefulWidget {
  @override
  PomodoroTimerState createState() => PomodoroTimerState();
}

Widget stopwatch() {
  return Container(
    child: Text(
      time,
      style: TextStyle(fontSize: 50),
    ),
  );
}
