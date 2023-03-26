import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_03/application/theme_service.dart';
import 'package:task_03/presentation/theme_animation/theme_animation_screen.dart';
import 'package:task_03/presentation/widget_examples/widget_examples_screen.dart';
import 'package:task_03/presentation/form_add_question/form_add_question_screen.dart';
import 'package:task_03/root_bottom_navigation.dart';
import 'package:task_03/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  List<Question> listOfQuestions = [
    Question(
        iCat: CategoryQuestion.education,
        iTextQuestion: "What is a school?",
        iHintList: ["hint 1 = education 1", "hint 2 = education 2"],
        iResponse: "school is ..."),
    Question(
        iCat: CategoryQuestion.geography,
        iTextQuestion: "What is the country next to Croatia?",
        iHintList: ["hint 1 = geography 1", "hint 2 = geography 2"],
        iResponse: "Italy"),
    Question(
        iCat: CategoryQuestion.sport,
        iTextQuestion: "Who is the best soccer player ever?",
        iHintList: ["hint 1 = sport 1", "hint 2 = sport 2"],
        iResponse: "choose whatever")
  ];
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: '/rootBottomNav',
        routes: <String, WidgetBuilder>{
          '/listQuestion': (BuildContext context) =>
              WidgetExampleScreen(listOfQuestions: listOfQuestions),
          '/formQuestion': (BuildContext context) =>
              AddQuestionForm(listOfQuestions: listOfQuestions),
          '/rootBottomNav': (BuildContext context) =>
              RootBottomNavigation(listOfQuestions: listOfQuestions),
          '/themeAnimation': (BuildContext context) =>
              const ThemeAnimationScreen(),
        },
      );
    });
  }
}

class Question {
  CategoryQuestion _category = CategoryQuestion.none;
  String _textQuestion = "";
  String _response = "";
  List<String> _hintList = [];

  Question(
      {required CategoryQuestion iCat,
      required String iTextQuestion,
      required List<String> iHintList,
      required String iResponse}) {
    _category = iCat;
    _textQuestion = iTextQuestion;
    _hintList = iHintList;
    _response = iResponse;
  }

  set setCategory(CategoryQuestion categoryQuestion) {
    _category = categoryQuestion;
  }

  CategoryQuestion get getCategory => _category;

  set setTextQuestion(String iTextQuestion) {
    _textQuestion = iTextQuestion;
  }

  String get getTextQuestion => _textQuestion;
  List<String> get getListHint => _hintList;
  String get getResponse => _response;
}

enum CategoryQuestion {
  none,
  sport,
  education,
  geography;

  String getPictureName() {
    switch (this) {
      case none:
        return "unnamed.png";
      case CategoryQuestion.sport:
        return "sport.jpg";
      case CategoryQuestion.education:
        return "education.jpg";
      case CategoryQuestion.geography:
        return "geo.png";
      default:
        return "problem with string";
    }
  }
}
