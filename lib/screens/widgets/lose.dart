import 'package:flutter/material.dart';

class LostWidget extends StatelessWidget {
  final Color color;
  final bool whoLost;
  const LostWidget({
    super.key,
    required this.color,
    required this.whoLost,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      whoLost ? "WHITE LOST" : "BLACK LOST",
      style: TextStyle(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
