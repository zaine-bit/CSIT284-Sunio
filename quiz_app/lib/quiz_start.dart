import 'package:flutter/material.dart';

class QuizStart extends StatelessWidget{
  const QuizStart({super.key});

@override
Widget build(BuildContext context) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/logo.png',
        width: 150,
        ),
        SizedBox(height: 30),
        Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: Text(
            'Start Quiz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
  );
}
}