import 'package:flutter/material.dart';
import 'package:task_03/main.dart';

class QuestionDetail extends StatefulWidget {
  const QuestionDetail({super.key, required this.question});

  final Question question;

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  int counterTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Question Details")),
        body: InkWell(
          onTap: () {
            setState(() {
              counterTap++;
            });
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Text(widget.question.getTextQuestion),
                counterTap > 0
                    ? Text("hint 1 : ${widget.question.getListHint[0]}")
                    : const Text("hint 1 : "),
                counterTap > 1
                    ? Text("hint 2 : ${widget.question.getListHint[1]}")
                    : const Text("hint 2 : "),
                counterTap > 2
                    ? Text(widget.question.getResponse)
                    : const Text(""),
              ],
            ),
          ),
        ));
  }
}
