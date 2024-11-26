import 'package:flutter_quiz_project/model/quiz.dart';

class Answer{
  final String questionAnswer;
  final Question question;
  Answer(this.question, {required this.questionAnswer});

  bool isCorrect(){
    return questionAnswer == question.goodAnswer;
  }
}

class Submission {
  final Map<Question,Answer> _answers = {};
  final Quiz quiz;
  Submission(this.quiz);

  void addAnswer(Question question, String answer){
    _answers[question] = Answer(question, questionAnswer: answer);
  }

  void removeAnswer(){
    _answers.clear();
  }

  int getScore(){
    int score = 0;
    for (var question in quiz.questions) {
      if (_answers.containsKey(question)) {
        if (_answers[question]!.isCorrect()) {
          score++;
        }
      }
    }
    return score;
  }

  Answer? getAnswerFor(Question question){
    return _answers[question];
  }
}