import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  final Color color;
  final int minutesLeft, secondsLeft;
  const TimeWidget({
    super.key,
    required this.color,
    required this.minutesLeft,
    required this.secondsLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          minutesLeft < 10 ? "0$minutesLeft" : "$minutesLeft",
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 60.0,
          ),
        ),
        Text(
          ":",
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 60.0,
          ),
        ),
        Text(
          secondsLeft < 10 ? "0$secondsLeft" : "$secondsLeft",
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 60.0,
          ),
        ),
      ],
    );
  }
}
