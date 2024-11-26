import 'package:flutter/material.dart';
import 'package:flutter_quiz_project/model/submission.dart';
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
  List<String?> userAnswer = [];
  late Submission submission;
  

  void changeState(QuizState newScreen) {
    setState(() {
      screenState = newScreen;
    });
  }

  void updateAnswer(int questionIndex, String? answer){
    setState(() {
      userAnswer[questionIndex] = answer;
      submission.addAnswer(widget.quiz.questions[questionIndex], answer!);
    });
  }
  
  
  Widget switchScreen() {
    switch (screenState) {
      case QuizState.notStart:
        return WelcomeScreen(changeState: changeState, quizTitle: widget.quiz,);
      case QuizState.started:
        return QuestionScreen(changeState: changeState, quiz: widget.quiz, submission: submission,);
      case QuizState.finished:
        return ResultScreen(changeState: changeState, submission: submission,);
      default:
        return WelcomeScreen(changeState: changeState, quizTitle: widget.quiz,);
    }
  }

  @override
  void initState(){
    super.initState();
    userAnswer = List<String?>.filled(widget.quiz.questions.length, null);
    submission = Submission(widget.quiz);
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


