import 'package:flutter/material.dart';
import 'package:flutter_quiz_project/model/quiz.dart';
import 'package:flutter_quiz_project/quiz_app.dart';

 class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.changeState, required this.quizTitle});
  final Function(QuizState) changeState;
  final Quiz quizTitle; 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/quiz-logo.png'), height: 400,),
              const SizedBox(height: 20,),
              Text(quizTitle.title, style: const TextStyle( fontSize: 56, color: Colors.white),),
              const SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  changeState(QuizState.started);
                },
                child: const Padding(
                  padding:  EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_right_alt_outlined, size: 56,),
                    SizedBox(width: 8),
                    Text('Take Quiz', style: TextStyle( fontSize: 28, color: Color.fromARGB(255, 102, 80, 164)),),
                  ],
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
 
