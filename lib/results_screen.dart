import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/result_data.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.results, this.changeScreen, {super.key});
  final List<String> results;
  final void Function(String) changeScreen;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_number': i,
        'question_text': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': results[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final data = getSummaryData();
    final totalQuestionsNumber = questions.length;
    final correctQuestionNumber = data.where((el) {
      return el['correct_answer'] == el['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Correct $correctQuestionNumber of $totalQuestionsNumber',
              style: const TextStyle(
                color: Color.fromARGB(255, 216, 243, 158),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ResultData(data),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  changeScreen("start_screen");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 216, 243, 158),
                    ),
                    Text(
                      "Try again",
                      style: TextStyle(
                        color: Color.fromARGB(255, 216, 243, 158),
                        fontSize: 25,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
