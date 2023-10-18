import 'package:flutter/material.dart';

import 'package:quiz_app/main_container.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  List<String> answers = [];
  void switchScreen() {
    answers = [];
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  void chooseAnswer(String answer) {
    setState(() {
      answers.add(answer);
    });
    if (answers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MainContianer(activeScreen, switchScreen, chooseAnswer, answers),
      ),
    );
  }
}
