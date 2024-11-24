import 'package:flutter/material.dart';
import 'package:flutter_quiz_project/quiz_app.dart';

class ResultScreen extends StatelessWidget {
  final Function(QuizState) changeState;
  const ResultScreen({super.key, required this.changeState});
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:(){
                   changeState(QuizState.notStart); },
                    child: const Text('Finished Quiz')),
            ],
          ),
        ),
      ),
    );
  }
}
 