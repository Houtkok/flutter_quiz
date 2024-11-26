import 'package:flutter/material.dart';
import 'package:flutter_quiz_project/model/submission.dart';
import 'package:flutter_quiz_project/quiz_app.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.changeState, required this.submission, });

  final Function(QuizState) changeState;
  final Submission submission;

  @override
  Widget build(BuildContext context) {
    final int totalQuestions = submission.quiz.questions.length;
    final int score = submission.getScore();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Score: $score / $totalQuestions',
                style: const TextStyle(fontSize: 36, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: totalQuestions,
                  itemBuilder: (context, index) {
                    final question = submission.quiz.questions[index];
                    String? userAnswer = submission.getAnswerFor(question)?.questionAnswer;
                    bool isCorrect = userAnswer != null && userAnswer == question.goodAnswer;
                    bool isUnanswered = userAnswer == null;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: isUnanswered
                            ? Colors.grey
                            : isCorrect
                                ? Colors.green
                                : Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Question: ${question.title}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                isUnanswered
                                    ? 'You did not answer this question \n Correct answer: You Did not answer the question!!!'
                                    : 'Your answer: $userAnswer',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              if (!isUnanswered)
                                Text(
                                  'Correct answer: ${question.goodAnswer}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  submission.removeAnswer();
                  changeState(QuizState.notStart);
                },
                child: const Text('Finished Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
