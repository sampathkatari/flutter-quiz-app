import 'package:flutter/material.dart';
import "package:quiz_app/data/questions.dart";
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.startQuiz, required this.answers});
  final void Function() startQuiz;
  final List<String> answers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < answers.length; i++) {
      final question = questions[i];
      final answer = answers[i];
      final isCorrect = question.answers[0] == answer;
      summaryData.add({
        'question_index': i,
        'question': question.question,
        'answer': answer,
        'isCorrect': isCorrect,
        'correctAnswer': question.answers[0]
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final correctAnswers =
        summaryData.where((data) => data['isCorrect'] as bool).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $correctAnswers out of ${questions.length} questions correctly.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              onPressed: startQuiz,
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.restart_alt_sharp),
            )
          ],
        ),
      ),
    );
  }
}
