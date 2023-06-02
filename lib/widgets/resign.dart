import 'package:flutter/material.dart';

class ResignWidget extends StatelessWidget {
  final Color color;
  final bool whoResign;
  const ResignWidget({
    super.key,
    required this.color,
    required this.whoResign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      whoResign ? "WHITE RESIGNED" : "BLACK RESIGNED",
      style: TextStyle(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
