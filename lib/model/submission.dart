import 'package:flutter_quiz_project/model/quiz.dart';

class Answer{
  final String questionAnswer;

  Answer({required this.questionAnswer});

  bool isCorrect(){
    return true;
  }
}

class Submission {
  final Map<Question,Answer> _answers = {};

  void addAnswer(Question question, String answer){
    _answers[question] = Answer(questionAnswer: answer);
  }

  void removeAnswer(){
    _answers.clear();
  }

  int getScore(){
    int score = 0;
    for(var answer in _answers.values){
      if(answer.isCorrect()){
        return score++;
      }
    }
    return score;
  }

  Answer? getAnswerFor(Question question, String answer){
    return _answers[question];
  }
}