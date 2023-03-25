import 'package:flutter/material.dart';
import 'package:task_03/presentation/form_add_question/form_add_question_screen.dart';
import 'package:task_03/presentation/theme_animation/theme_animation_screen.dart';
import 'package:task_03/presentation/widget_examples/widget_examples_screen.dart';

import 'main.dart';

class RootBottomNavigation extends StatefulWidget {
  const RootBottomNavigation({super.key, required this.listOfQuestions});
  
  final List<Question> listOfQuestions;
  @override
  State<RootBottomNavigation> createState() => _RootBottomNavigationState();
}

class _RootBottomNavigationState extends State<RootBottomNavigation> {
    
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          WidgetExampleScreen(listOfQuestions: widget.listOfQuestions),
          AddQuestionForm(listOfQuestions: widget.listOfQuestions),
          const ThemeAnimationScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'list_question'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'form_add_question'),
          BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'theme_animation'),
        ],
      ),
    );
  }
}
