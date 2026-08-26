import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_start.dart';
void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF460090),
                Color(0xFF6100A1),
             ],
            ),
          ),
          child: QuizStart(),
        ),
      ),
    ),
  );
}
