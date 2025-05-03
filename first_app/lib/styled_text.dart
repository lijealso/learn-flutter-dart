import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
<<<<<<< HEAD
   const StyledText(this.text, {super.key});

final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
=======
  const StyledText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Olá Mundo',
      style: TextStyle(
>>>>>>> 1ce7d44f69bfa65608529f404dec888c1e1f6e38
        fontSize: 28.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}