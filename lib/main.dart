import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {
  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      goodAnswer: 'ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["blue", "red", 'green'],
      goodAnswer: 'red');
  Question q3 = const Question(
      title: "What is the capital of France?",
      possibleAnswers: ["Paris", "London", 'Berlin'],
      goodAnswer: 'Paris');
  Question q4 = const Question(
      title: "What is 2 + 2?",
      possibleAnswers: ["3", "4", '5'],
      goodAnswer: '4');
  Question q5 = const Question(
      title: "Which planet is known as the Red Planet?",
      possibleAnswers: ["Earth", "Mars", 'Jupiter'],
      goodAnswer: 'Mars');
  Question q6 = const Question(
      title: "What is the largest ocean on Earth?",
      possibleAnswers: ["Atlantic", "Indian", 'Pacific'],
      goodAnswer: 'Pacific');
  Question q7 = const Question(
      title: "Who wrote 'Romeo and Juliet'?",
      possibleAnswers: ["Shakespeare", "Hemingway", 'Tolkien'],
      goodAnswer: 'Shakespeare');
  Question q8 = const Question(
      title: "What is the smallest prime number?",
      possibleAnswers: ["1", "2", '3'],
      goodAnswer: '2');
  Question q9 = const Question(
      title: "What is the chemical symbol for water?",
      possibleAnswers: ["H2O", "O2", 'CO2'],
      goodAnswer: 'H2O');
  Question q10 = const Question(
      title: "Which country is known as the Land of the Rising Sun?",
      possibleAnswers: ["China", "Japan", 'Korea'],
      goodAnswer: 'Japan');

  List<Question> myQuestions = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10];

  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);

  runApp(QuizApp(myQuiz));
}
