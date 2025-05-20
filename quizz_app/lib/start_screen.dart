import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A stateless widget that displays the start screen of the quiz.
///
/// This widget shows a logo, some descriptive text, and a button that starts the quiz.
/// The [startQuiz] callback is invoked when the user presses the "Start Quiz" button.
class StartScreen extends StatelessWidget {
  /// Creates a [StartScreen].
  ///
  /// The [startQuiz] callback must not be null.
  const StartScreen(this.startQuiz, {super.key});

  /// A callback that is invoked to start the quiz.
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Displays the quiz logo.
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          /*
          // Opacity widget is not recommended for performance reasons.
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 250),
          ),
          */
          const SizedBox(height: 80),
          // Displays a description text.
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          // A button that triggers the quiz start when pressed.
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(
                color: Color.fromARGB(255, 255, 255, 255),
                width: 1,
              ),
            ),
            icon: const Icon(Icons.start),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
