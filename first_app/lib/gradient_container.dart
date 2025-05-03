import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';
<<<<<<< HEAD

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;
=======
>>>>>>> 1ce7d44f69bfa65608529f404dec888c1e1f6e38

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
<<<<<<< HEAD
        child: StyledText('Hello World!'),
=======
        child: StyledText()
>>>>>>> 1ce7d44f69bfa65608529f404dec888c1e1f6e38
      ),
    );
  }
}

// Alternative implementation

/* class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyledText('Hello World!'),
      ),
    );
  }
} */