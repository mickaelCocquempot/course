import 'package:flutter/material.dart';

class TextFieldQuestion extends StatelessWidget {
  const TextFieldQuestion({super.key, required this.labelTextQuestion, required this.myController});

  final String labelTextQuestion;
  final TextEditingController myController;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: myController,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: labelTextQuestion,
        ),
      ),
    );
  }
}