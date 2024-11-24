import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_project/model/quiz.dart';
import 'package:flutter_quiz_project/quiz_app.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key, required this.changeState, required this.quiz});
  final Function(QuizState) changeState;
  final Quiz quiz;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String?> selectedAnswer = [];
  int questionIndex = 0;
  Timer? countDowntime;
  int timeLeft = 3;
  bool showCorrect = false;
  bool noSelection = false;

  @override
  void initState() {
    super.initState();
    selectedAnswer = List<String?>.filled(widget.quiz.questions.length, null);
    startTimer();
  }

  void startTimer() {
    timeLeft = 3;
    countDowntime?.cancel();
    countDowntime = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          submitAnswer();
          countDowntime?.cancel();
        }
      });
    });
  }

  void submitAnswer() {
    if (selectedAnswer[questionIndex] == null) {
      noSelection = true;
    }
    setState(() {
      showCorrect = true;
      countDowntime?.cancel();
    });
  }

  void selectAnswer(String answer) {
    if(!showCorrect){
      setState(() {
        selectedAnswer[questionIndex] = answer;
        noSelection = false;
      });
    submitAnswer();
    }
  }

  void nextQuestion() {
    if (questionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        questionIndex++;
        showCorrect = false;
        noSelection = false;
        startTimer();
      });
    } else {
      widget.changeState(QuizState.finished);
    }
  }

  @override
  Widget build(BuildContext context) {
    String correctAnswer = widget.quiz.questions[questionIndex].goodAnswer;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Time : $timeLeft',
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.quiz.questions[questionIndex].title,
                style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              ...List.generate(
                  widget.quiz.questions[questionIndex].possibleAnswers.length,
                  (index) {
                var answer =
                    widget.quiz.questions[questionIndex].possibleAnswers[index];
                bool isCorrect = answer == correctAnswer;
                bool isSelected = selectedAnswer[questionIndex] == answer;
                Color answerColor = Colors.white;
                if (showCorrect) {
                  if (noSelection) {
                    answerColor = isCorrect ? Colors.orange : Colors.white;
                  } else {
                    if (isCorrect) {
                      answerColor = Colors.green; 
                    } else if (isSelected) {
                      answerColor = Colors.red;
                    }
                  }
                } else if (isSelected) {
                  answerColor = Colors.orange;
                }
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () => selectAnswer(answer),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: answerColor),
                      child: Text(answer,
                          style: const TextStyle(
                            fontSize: 24,
                          )),
                    ),
                  ),
                );
              }),
              if (showCorrect)
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: nextQuestion,
                      child: const Text('Next Question'),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
