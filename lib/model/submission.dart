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

  void addAnswer(Question question, String answer){
    _answers[question] = Answer(question, questionAnswer: answer);
  }

  void removeAnswer(){
    _answers.clear();
  }

  int getScore(){
    int score = 0;
    for(var answer in _answers.values){
      if(answer.isCorrect()){
        score++;
      }
    }
    return score;
  }

  Answer? getAnswerFor(Question question){
    return _answers[question];
  }
}