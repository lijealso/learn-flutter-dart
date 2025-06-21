import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/start_screen.dart';

/// A widget that represents the Quiz application.
///
/// This widget manages the state of the quiz and is responsible for switching
/// between the start screen and the questions screen.
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

/// This class manages the active screen of the quiz and handles the screen switching logic.
///
/// The quiz starts with the [StartScreen] widget. When the user triggers a screen
/// switch (via [switchScreen]), the active screen is updated to display the
/// [QuestionsScreen].
class _QuizState extends State<Quiz> {
  /// The current active screen widget. This will either be a [StartScreen] or a [QuestionsScreen].
  Widget? activeScreen;

  @override
  void initState() {
    // Set the initial active screen to the start screen.
    activeScreen = StartScreen(switchScreen);
    // This method is passed as a callback to the [StartScreen] widget. When invoked, it updates the state to use [QuestionsScreen] as the active screen.
    super.initState();
  }

  /// Switches the active screen from the start screen to the questions screen.
  ///
  /// This method is passed as a callback to the [StartScreen] widget. When invoked,
  /// it updates the state to use [QuestionsScreen] as the active screen.
  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // Apply a gradient background decoration to the quiz interface.
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 67, 46, 116), Color.fromARGB(255, 172, 124, 190)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Display the current active screen (start or questions screen).
          child: activeScreen,
        ),
      ),
    );
  }
}
