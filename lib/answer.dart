import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function ansQuestion;
  final String value;
  final int score;

  Answer(this.ansQuestion, this.value, this.score);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(value), 
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red[300])),
        onPressed : () => ansQuestion(score) 
        ),
    );
  }
}