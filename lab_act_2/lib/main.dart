import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueAccent,
              Colors.deepOrangeAccent
            ])
          ),
          child: Center(child: Text("Hello World"))),
      ),
    ),
  );
}
