import 'package:flutter/material.dart';

class ResultData extends StatelessWidget {
  const ResultData(this.data, {super.key});
  final List<Map<String, Object>> data;

  @override
  Widget build(context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 400.0),
      child: SingleChildScrollView(
        child: Column(
          children: data.map((el) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: el['correct_answer'] == el['user_answer']
                        ? Color.fromARGB(255, 188, 220, 146)
                        : Color.fromARGB(255, 235, 161, 147),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    ((el['question_number'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        el['question_text'] as String,
                        style: TextStyle(
                          color: el['correct_answer'] == el['user_answer']
                              ? Color.fromARGB(255, 231, 251, 204)
                              : Color.fromARGB(255, 252, 199, 188),
                          fontSize: 20,
                        ),
                      ),
                      Text(el['correct_answer'] as String),
                      el['correct_answer'] == el['user_answer']
                          ? const SizedBox(
                              width: 5,
                            )
                          : Text(
                              el['user_answer'] as String,
                              style: const TextStyle(color: Colors.red),
                            )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
