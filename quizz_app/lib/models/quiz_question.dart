// A class representing a quiz question with its possible answers.
// The [questionText] is the text of the question.
// The [answers] is a list of possible answers.
class QuizQuestion {
  // A constructor that takes the question text and a list of possible answers.
    const QuizQuestion(
    this.questionText,
    this.answers,
  );

  final String questionText;
  final List<String> answers;
}
