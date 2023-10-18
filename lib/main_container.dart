import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class MainContianer extends StatelessWidget {
  const MainContianer(
    this.activeScreen,
    this.startQuiz,
    this.chooseAnswer,
    this.answers, {
    super.key,
  });
  final void Function(String answer) chooseAnswer;
  final String activeScreen;
  final void Function() startQuiz;
  final List<String> answers;
  @override
  Widget build(BuildContext context) {
    Widget activeScreenWidget = () {
      if (activeScreen == 'results-screen') {
        return ResultsScreen(startQuiz: startQuiz, answers: answers);
      } else if (activeScreen == 'quiz-screen') {
        return Questions(chooseAnswer);
      }
      return HomeScreen(startQuiz: startQuiz);
    }();

    // Widget activeScreenWidget = activeScreen == 'start-screen'
    //     ? HomeScreen(startQuiz: startQuiz)
    //     : Questions(chooseAnswer);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: activeScreenWidget,
    );
  }
}
