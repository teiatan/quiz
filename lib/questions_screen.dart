import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.changeScreen, this.saveResults, {super.key});
  final Function(String) changeScreen;
  final Function(List<String>) saveResults;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  final List<String> userAnswers = [];

  void switchToNextQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  void addAnswer(String answer) {
    userAnswers.add(answer);
  }

  void onTapAnswer(String answerText) {
    addAnswer(answerText);
    if (userAnswers.length == questions.length) {
      widget.changeScreen("results_screen");
      widget.saveResults(userAnswers);
      // userAnswers.clear();
    } else {
      switchToNextQuestion();
    }
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                  color: Color.fromARGB(255, 206, 224, 151),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  text: answer,
                  onTap: () {
                    onTapAnswer(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}
