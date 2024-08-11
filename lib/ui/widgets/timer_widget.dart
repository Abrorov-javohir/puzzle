import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late final Stopwatch _stopwatch;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTime);
    _stopwatch.start();
  }

  void _updateTime(Timer timer) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_stopwatch.elapsed.inSeconds / 60).floor();
    final seconds = _stopwatch.elapsed.inSeconds % 60;

    return Text(
      '$minutes:${seconds.toString().padLeft(2, '0')}',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}
