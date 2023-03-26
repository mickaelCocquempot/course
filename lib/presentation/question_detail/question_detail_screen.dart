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
  double _sizeHintTwo = 14.0;
  String _textHintTwo = "hint 2 : ";
  bool shouldDisplayFirstHint = false;

  Text hintOne(
      bool isTapOverZero, String textIfUnderZeroTap, String textIfOverZeroTap) {
    return isTapOverZero ? Text(textIfOverZeroTap) : Text(textIfUnderZeroTap);
  }

  AnimatedDefaultTextStyle hintTwo() {
    return AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 400),
        style: TextStyle(fontSize: _sizeHintTwo, color: Colors.black),
        child: Text(_textHintTwo));
  }

  Widget solution(
    bool isTapOverTwo,
  ) {
    return isTapOverTwo
        ? TweenAnimationBuilder(
            duration: const Duration(milliseconds: 800),
            tween: Tween(begin: 20.0, end: 40.0),
            builder: (context, value, child) {
              return Text(
                widget.question.getResponse,
                style: TextStyle(color: Colors.black, fontSize: value),
              );
            },
          )
        : const SizedBox(
            height: 1,
          );
  }

  @override
  Widget build(BuildContext context) {
    shouldDisplayFirstHint = counterTap > 0;
    return Scaffold(
        appBar: AppBar(title: const Text("Question Details")),
        body: InkWell(
          onTap: () {
            setState(() {
              counterTap++;
              if (counterTap > 1) {
                _sizeHintTwo = 40.0;
                _textHintTwo = "hint 2 : ${widget.question.getListHint[1]}";
              }
            });
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(children: <Widget>[
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                top: shouldDisplayFirstHint
                    ? 150
                    : MediaQuery.of(context).size.height - 50,
                child: Column(
                  children: [
                    Text(widget.question.getTextQuestion),
                    hintOne(shouldDisplayFirstHint, "hint 1 : ",
                        "hint 1 : ${widget.question.getListHint[0]}"),
                    hintTwo(),
                    solution(counterTap > 2),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
