import 'package:flutter_quiz_project/model/quiz.dart';
import 'package:flutter_quiz_project/model/submission.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Quiz', () {
    test('Test for correct', () {
      const question1 = Question(
          title: 'What is the capital city of Cambodia',
          possibleAnswers: ['Kampot', 'PreyVeng','PhnomPenh', 'SiemReab'],
          goodAnswer: 'PhnomPenh');
      final answer = Answer(question1, questionAnswer: 'PhnomPenh');
      final result = answer.isCorrect();
      expect(result, isTrue);
    });
    test('Test for incorrect', () {
        const question2 = Question(
            title: 'What is the capital city of Cambodia',
            possibleAnswers: ['Kampot', 'PreyVeng','PhnomPenh', 'SiemReab'],
            goodAnswer: 'PhnomPenh');
        final answer = Answer(question2, questionAnswer: 'SiemReab');
        final result = answer.isCorrect();
        expect(result, isFalse);
      });
    });
    test('Test for score correct', (){
        const quest1 = Question(
            title: 'What is the capital city of Cambodia',
            possibleAnswers: ['Kampot', 'PreyVeng','PhnomPenh', 'SiemReab'],
            goodAnswer: 'PhnomPenh');
        const quest2 = Question(
            title: 'What is the best programming laguage',
            possibleAnswers: ['Python', 'JS', 'R','Dart'],
            goodAnswer: 'Dart');
        final quiz = Quiz(title: 'Sample Quiz', questions: [quest1, quest2]);
        final submission = Submission(quiz);
        submission.addAnswer(quest1, 'PhnomPenh');
        submission.addAnswer(quest2, 'Dart');
        final score = submission.getScore();

        expect(score, equals(2));
    });
    test('Test for score incorrect', (){
        const quest1 = Question(
            title: 'What is the capital city of Cambodia',
            possibleAnswers: ['Kampot', 'PreyVeng','PhnomPenh', 'SiemReab'],
            goodAnswer: 'PhnomPenh');
        const quest2 = Question(
            title: 'What is the best programming laguage',
            possibleAnswers: ['Python', 'JS', 'R','Dart'],
            goodAnswer: 'Dart');
        final quiz = Quiz(title: 'Sample Quiz', questions: [quest1, quest2]);
        final submission = Submission(quiz);
        submission.addAnswer(quest1, 'PreyVeng');
        submission.addAnswer(quest2, 'JS');
        final score = submission.getScore();

        expect(score, equals(0));
    });
  }