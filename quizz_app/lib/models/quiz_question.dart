// A class representing a quiz question with its possible answers.
// The [questionText] is the text of the question.
// The [answers] is a list of possible answers.
class QuizQuestion {
  // A constructor that takes the question text and a list of possible answers.
  const QuizQuestion(this.questionText, this.answers);

  final String questionText;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // List.of creates a new list from the original list of answers.
    // Shuffle the answers randomly and return the shuffled list.
    final shuffledList = List.of(answers);
    shuffledList.shuffle();

    return shuffledList;
  }
}
