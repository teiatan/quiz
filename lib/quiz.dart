import 'package:flutter/material.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/results_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  List<String> results = [];

  void changeScreen(String screenName) {
    setState(() {
      activeScreen = screenName;
    });
  }

  void saveResults(List<String> userAnswers) {
    setState(() {
      results = userAnswers;
      activeScreen = "results_screen";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(changeScreen);
    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(changeScreen, saveResults);
    }
    if (activeScreen == "results_screen") {
      screenWidget = ResultsScreen(results, changeScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 2, 99, 5),
              Color.fromARGB(255, 131, 185, 70),
              Color.fromARGB(255, 162, 205, 134)
            ], stops: [
              0,
              0.7,
              1
            ], begin: Alignment.topCenter, end: Alignment.bottomLeft),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
