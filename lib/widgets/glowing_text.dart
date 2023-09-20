import 'package:flutter/material.dart';

class GlowingText extends StatelessWidget {
  final String text;
  final List<Shadow> shadows;
  final double fontSize;

  const GlowingText({
    super.key,
    required this.text,
    required this.shadows,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: shadows,
      ),
    );
  }
}
