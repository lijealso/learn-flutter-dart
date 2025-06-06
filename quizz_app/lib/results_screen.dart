import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'questions_summary.dart';
import 'quiz_64.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart,
  });

  final List<String> chosenAnswers;

  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        'correct': questions[i].answers[0] == chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30),
            TextButton.icon(
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.refresh),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                // Handle restart quiz action
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Quiz()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
