import 'package:flutter/material.dart';
import 'stopwatch_page.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  double _milisec = 0;
  double _sec = 0;
  double _min = 0;
  late Timer _timer;
  bool _isRunning = false;
  bool _isPaused = false;

  void initState() {
    super.initState();
    _resetTimer();
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _resetTimer() {
    _milisec = 0;
    _sec = 0;
    _min = 0;
    _isRunning = false;
    _isPaused = false;
  }

  void _pause() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
      _isPaused = true;
    });
  }

  void _start() {
    if (!_isRunning) {
      _isRunning = true;
      _isPaused = false;
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _milisec++;
        if (_milisec == 100) {
          _sec++;
          _milisec = 0;
          if (_sec == 60) {
            _min++;
            _sec = 0;
          }
        }
      });
    });
  }

  void _reset() {
    _resetTimer();
    _timer.cancel();
    setState(() {});
  }

  String _formatTime(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return StopwatchPage(
      min: _min,
      sec: _sec,
      milisec: _milisec,
      isRunning: _isRunning,
      isPaused: _isPaused,
      start: _start,
      pause: _pause,
      reset: _reset,
      formatTime: _formatTime,
    );
  }
}
