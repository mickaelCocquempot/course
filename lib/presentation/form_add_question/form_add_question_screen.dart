import 'package:flutter/material.dart';
import 'package:task_03/main.dart';
import 'package:task_03/presentation/form_add_question/widgets/text_field_question.dart';
import 'package:task_03/presentation/widget_examples/widget_examples_screen.dart';
import 'package:task_03/root_bottom_navigation.dart';

class AddQuestionForm extends StatefulWidget {
  const AddQuestionForm({super.key, required this.listOfQuestions});
  final List<Question> listOfQuestions;
  @override
  State<AddQuestionForm> createState() => _AddQuestionFormState();
}

class _AddQuestionFormState extends State<AddQuestionForm> {
  final myQuestionController = TextEditingController();
  final myFirstHintController = TextEditingController();
  final mySecondHintController = TextEditingController();
  final myResponseController = TextEditingController();

  @override
  void dispose() {
    myQuestionController.dispose();
    myFirstHintController.dispose();
    mySecondHintController.dispose();
    myResponseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width - 16,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).colorScheme.primaryContainer),
                  child: const Center(
                      child: Text("Form to add question",
                          style:
                              TextStyle(color: Colors.white, fontSize: 23)))),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView(
            children: [
              TextFieldQuestion(
                  labelTextQuestion: "Put your question",
                  myController: myQuestionController),
              const SizedBox(
                height: 20,
              ),
              TextFieldQuestion(
                  labelTextQuestion: "Put your first hint",
                  myController: myFirstHintController),
              const SizedBox(
                height: 20,
              ),
              TextFieldQuestion(
                  labelTextQuestion: "Put your second hint",
                  myController: mySecondHintController),
              const SizedBox(
                height: 20,
              ),
              TextFieldQuestion(
                  labelTextQuestion: "Put your response",
                  myController: myResponseController),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () => {
                        widget.listOfQuestions.add(Question(
                            iCat: CategoryQuestion.none,
                            iTextQuestion: myQuestionController.text,
                            iHintList: [
                              myFirstHintController.text,
                              mySecondHintController.text
                            ],
                            iResponse: myResponseController.text)),
                        // Navigator.pushAndRemoveUntil<dynamic>(
                        //   context,
                        //   MaterialPageRoute<dynamic>(
                        //     builder: (BuildContext context) =>
                        //         RootBottomNavigation(
                        //             currentIndex:0),
                        //   ),
                        //   (route) =>
                        //       false, //if you want to disable back feature set to false
                        // )
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>
                        //         RootBottomNavigation(currentIndex: 0)))
                        Navigator.pushReplacementNamed(context, '/rootBottomNav'),

                      },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Theme.of(context).colorScheme.primaryContainer),
                      width: 150,
                      height: 50,
                      child: const Center(
                          child: Text("Add this question",
                              style: TextStyle(
                                color: Colors.white,
                              )))))
            ],
          ),
        ),
      ]),
    );
  }
}
