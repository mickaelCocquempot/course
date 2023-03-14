import 'package:flutter/material.dart';
import 'package:task_03/presentation/widget_examples/widgets/stack_image_category.dart';

import '../../../main.dart';

class RowImgQuestions extends StatelessWidget {
  const RowImgQuestions(
      {super.key, required this.itemQuestion});

  final Question itemQuestion;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionDetail(question: itemQuestion)))
      },
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 100,
              child: categoryWidget(itemQuestion.getCategory),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
                height: 100,
                color: Colors.red,
                child: Center(
                  child: Text(itemQuestion.getTextQuestion),
                )),
          ),
        ],
      ),
    );
  }
}
