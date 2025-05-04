import 'package:flutter/material.dart';
import 'gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyStatelessWidget(title: 'Stateless Example'),
    ),
  );
}

class MyStatelessWidget extends StatelessWidget {
  final String title;

  const MyStatelessWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        Color.fromARGB(255, 70, 120, 226),
        Color.fromARGB(255, 55, 25, 110),
      ),
    );
  }
}
