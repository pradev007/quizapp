import 'dart:async';
import 'package:flutter/material.dart';

class ProgressIndicatorBar extends StatefulWidget {
  const ProgressIndicatorBar({super.key});

  @override
  _ProgressIndicatorBarState createState() => _ProgressIndicatorBarState();
}

class _ProgressIndicatorBarState extends State<ProgressIndicatorBar> {
  int totalSecs = 20;
  int secsRemaining = 20;
  double progressFraction = 0.0;
  int percentage = 0;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic (const Duration(seconds: 1), (_) {
      if (secsRemaining == 0) {
        return;
      }
      setState(() {
        secsRemaining -= 1;
        progressFraction = (totalSecs - secsRemaining) / totalSecs;
        percentage = (progressFraction * 100).floor();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 5.0,
          left: 5.0,
          child: SizedBox(
            height: 70.0,
            width: 70.0,
            child: CircularProgressIndicator(
              value: progressFraction,
              strokeWidth: 5,
              color: Colors.red,
            ),
          ),
        ),
        Center(child: Text('$secsRemaining sec')),
      ],
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
