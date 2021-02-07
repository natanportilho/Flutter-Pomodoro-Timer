import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pomodoro/pomodoro_timer_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      home: PomodoroTimer(),
    );
  }
}
