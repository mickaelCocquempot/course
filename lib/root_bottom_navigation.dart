import 'package:flutter/material.dart';
import 'package:task_03/presentation/form_add_question/form_add_question_screen.dart';
import 'package:task_03/presentation/widget_examples/widget_examples_screen.dart';

import 'main.dart';

class RootBottomNavigation extends StatefulWidget {
  RootBottomNavigation({super.key, required this.currentIndex, required this.listOfQuestions});
  int currentIndex;
  final List<Question> listOfQuestions;
  @override
  State<RootBottomNavigation> createState() => _RootBottomNavigationState();
}

class _RootBottomNavigationState extends State<RootBottomNavigation> {
    
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currentIndex,
        children: [
          WidgetExampleScreen(listOfQuestions: widget.listOfQuestions),
          AddQuestionForm(listOfQuestions: widget.listOfQuestions),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 73, 198, 185),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            widget.currentIndex = value;
          });
        },
        currentIndex: widget.currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'list_question'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'form_add_question'),
        ],
      ),
    );
  }
}
