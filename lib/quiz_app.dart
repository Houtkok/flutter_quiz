import 'package:flutter/material.dart';
import 'package:flutter_quiz_project/screens/question_screen.dart';
import 'package:flutter_quiz_project/screens/result_screen.dart';
import 'package:flutter_quiz_project/screens/welcome_screen.dart';
import 'model/quiz.dart';

enum QuizState { notStart, started, finished }

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var screenState = QuizState.notStart;

  void changeState(QuizState newScreen) {
    setState(() {
      screenState = newScreen;
    });
  }
  

  final Quiz test1 = Quiz(title: 'Crazy Quizz', questions: [
    const Question(
        title: "Who is the best teacher?",
        possibleAnswers: ["ronan", "hongly", 'leangsiv'],
        goodAnswer: 'ronan'),
    const Question(
        title: "Who is the best teacher?",
        possibleAnswers: ["ronan", "hongly", 'leangsiv'],
        goodAnswer: 'hongly'),
    const Question(
        title: "Who is the best teacher?",
        possibleAnswers: ["ronan", "hongly", 'leangsiv'],
        goodAnswer: 'leangsiv'),
  ]);
  
  Widget switchScreen() {
    switch (screenState) {
      case QuizState.notStart:
        return WelcomeScreen(changeState: changeState, quizTitle: test1,);
      case QuizState.started:
        return QuestionScreen(changeState: changeState, quiz: test1);
      case QuizState.finished:
        return ResultScreen(changeState: changeState);
      default:
        return WelcomeScreen(changeState: changeState, quizTitle: test1,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: switchScreen(),
        ),
      ),
    );
  }
}
