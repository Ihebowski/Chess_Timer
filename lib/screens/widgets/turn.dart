import 'package:flutter/material.dart';

class TurnWidget extends StatelessWidget {
  final Color color;
  final bool whoTurn;
  const TurnWidget({
    super.key,
    required this.color,
    required this.whoTurn,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      whoTurn ? "WHITE'S TURN" : "BLACK'S TURN",
      style: TextStyle(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
