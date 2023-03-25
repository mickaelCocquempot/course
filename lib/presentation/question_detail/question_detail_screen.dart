import 'package:flutter/material.dart';
import 'package:task_03/main.dart';

class QuestionDetail extends StatefulWidget {
  QuestionDetail({super.key, required this.question});

  final Question question;
  double _sizeHintTwo = 14.0;
  String _textHintTwo = "hint 2 : ";

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
              if (counterTap > 1) {
                widget._sizeHintTwo = 40.0;
                widget._textHintTwo =
                    "hint 2 : ${widget.question.getListHint[1]}";
              }
            });
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(children: <Widget> [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                top: counterTap > 0
                    ? 150
                    : MediaQuery.of(context).size.height - 50,
                child: Column(
                  children: [
                    Text(widget.question.getTextQuestion),
                    counterTap > 0
                        ? Text("hint 1 : ${widget.question.getListHint[0]}")
                        : const Text("hint 1 : "),
                    AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 400),
                        style: TextStyle(
                            fontSize: widget._sizeHintTwo, color: Colors.black),
                        child: Text(widget._textHintTwo)),
                    counterTap > 2
                        ? TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 800),
                            tween: Tween(begin: 20.0, end: 40.0),
                            builder: (context, value, child) {
                              return Text(
                                widget.question.getResponse,
                                style: TextStyle(
                                    color: Colors.black, fontSize: value),
                              );
                            },
                          )
                        : const SizedBox(
                            height: 1,
                          ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
