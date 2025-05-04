import 'package:flutter/material.dart';
import 'package:quizz_app/54_challenge/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(home: MyStatelessWidget()),
  );
}

class MyStatelessWidget extends StatelessWidget {

  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradientContainer(
        Color.fromARGB(255, 70, 5, 221),
        Color.fromARGB(255, 101, 53, 190),
      ),
    );
  }
}