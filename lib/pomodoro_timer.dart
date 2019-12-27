import 'dart:async';

import 'package:flutter/material.dart';

class MyPomodoroTimer extends ChangeNotifier {
  var duration = const Duration(seconds: 1);
  Stopwatch watch = Stopwatch();
  int initialMinutes = 24;
  int initialSeconds = 60;
  String time = '25:00';

  start() {
    if (_isPlaying()) {
      watch.stop();
    } else {
      watch.start();
      _startTimer();
    }
  }

  bool _isPlaying() {
    return watch.isRunning;
  }

  void _startTimer() {
    Timer(duration, _keepRunning);
  }

  void _keepRunning() {
    if (watch.isRunning) {
      _startTimer();
    }
    
    int currentMinute = int.parse(watch.elapsed.inMinutes.toString());
    int currentSeconds = int.parse((watch.elapsed.inSeconds % 60).toString());
    int timerMinutes = initialMinutes - currentMinute;
    int timerSeconds = initialSeconds - currentSeconds;

    if (timerSeconds < 60 && timerSeconds >= 0) {
      time = timerMinutes.toString().padLeft(2, '0') +
          ':' +
          timerSeconds.toString().padLeft(2, '0');

      if (time == '00:00') {
        // _playSong();
      }
    }
    if (timerMinutes < 0) {
      time = '00:00';
      watch.stop();
    }
  }
}
