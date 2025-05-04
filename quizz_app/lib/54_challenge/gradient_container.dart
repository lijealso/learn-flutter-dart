import 'package:flutter/material.dart';
import 'package:quizz_app/54_challenge/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/quiz-logo.png',
              width: 300,
              height: 300,
),
            const SizedBox(height: 70),
            const StyledText(
              'Learn Flutter the fun way!',
              style: TextStyle(
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 65, 14, 206),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                print('Button Pressed!');
              },
              child: const Text(
                'Start Quiz',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
