import 'package:flutter/material.dart';

class StopwatchPage extends StatelessWidget {
  final double min;
  final double sec;
  final double milisec;
  final bool isRunning;
  final bool isPaused;
  final VoidCallback start;
  final VoidCallback pause;
  final VoidCallback reset;
  final String Function(int) formatTime;

  const StopwatchPage({
    super.key,
    required this.min,
    required this.sec,
    required this.milisec,
    required this.isRunning,
    required this.isPaused,
    required this.start,
    required this.pause,
    required this.reset,
    required this.formatTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 233, 70),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 233, 70),
        title: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Text(
            'StopWatch',
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255), fontSize: 30),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 254, 254)),
                ),
                child: Center(
                  child: Text(
                    '${formatTime(min.toInt())} : ${formatTime(sec.toInt())} : ${formatTime(milisec.toInt())}',
                    style: TextStyle(
                        fontSize: 24,
                        color: const Color.fromARGB(255, 235, 32, 32)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: !isRunning || !isPaused ? start : null,
                  child: Text(
                    'Start',
                    // style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 12),
                TextButton(
                  onPressed: isRunning ? pause : null,
                  child: Text(
                    'Pause',
                    // style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 12),
                TextButton(
                  onPressed:
                      isPaused || (!isRunning && milisec > 0) ? reset : null,
                  child: Text(
                    'Reset',
                    // style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
