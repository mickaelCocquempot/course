
import 'package:flutter/material.dart';
import 'package:task_03/presentation/widget_examples/widgets/row_images_questions.dart';

import '../../main.dart';


class WidgetExampleScreen extends StatefulWidget {
  const WidgetExampleScreen({super.key, required this.listOfQuestions});
  final List<Question> listOfQuestions;
  @override
  State<WidgetExampleScreen> createState() => _WidgetExampleScreenState();
}

class _WidgetExampleScreenState extends State<WidgetExampleScreen> {


  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(title: const Text("task 02")),
      body: Flex(
        direction: orientation == Orientation.portrait
            ? Axis.vertical
            : Axis.horizontal,
        children: [
          Expanded(
            child: CustomListWidget(
              listOfQuestions: widget.listOfQuestions,
            ),
          ),
          // AddQuestionToListButton(onTap: () {
          //   setState(() {
          //     lRandom = Random().nextInt(3);
          //     listOfQuestions.add(listOfQuestions[lRandom]);
          //   });
          // })
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ThemeService>(context, listen: false).toggleTheme();
      //   },
      //   backgroundColor: Theme.of(context).primaryColor,
      //   child: const Icon(Icons.play_arrow),
      // ),
    );
  }
}

class CustomListWidget extends StatelessWidget {
  const CustomListWidget({
    super.key,
    required this.listOfQuestions,
  });

  final List<Question> listOfQuestions;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) =>
                RowImgQuestions(itemQuestion: listOfQuestions[index]),
            childCount: listOfQuestions.length,
          ),
        ),
      ],
    );
  }
}
