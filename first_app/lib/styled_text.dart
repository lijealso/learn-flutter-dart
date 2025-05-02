import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Olá Mundo',
      style: TextStyle(
        fontSize: 28.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}