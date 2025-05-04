import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key, required TextStyle style});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
