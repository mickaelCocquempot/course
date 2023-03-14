import 'package:flutter/material.dart';

class AddQuestionToListButton extends StatelessWidget {
  final Function() onTap;
  const AddQuestionToListButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
          width: 50,
          height: 50,
          color: Colors.blue,
          child: InkWell(
            onTap: () => onTap(),
            splashColor: Colors.red,
            child: const Center(child: Text("Add")),
          )),
    );
  }
}
