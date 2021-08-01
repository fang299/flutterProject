import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  List questions = [
    {
      'questionText': 'What is your favorite color?',
      'Answer': [
        {'text': 'blue', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'yellow', 'score': 3},
        {'text': 'green', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'Answer': [
        {'text': 'cat', 'score': 10},
        {'text': 'dog', 'score': 5},
        {'text': 'pig', 'score': 3},
        {'text': 'rat', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your favorite actor?',
      'Answer': [
        {'text': 'ester', 'score': 10},
        {'text': 'carla', 'score': 5},
        {'text': 'samuel', 'score': 3},
        {'text': 'skyler', 'score': 1},
      ]
    },
  ];
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void ansQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print("This is your choice!");
    if (_questionIndex < questions.length) {
      print("We have more questions");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        //We want to add more stuff into the body, but if we use text we can not add
        // other things else, therefore we use an invisible widget "column"
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(questions[_questionIndex]['questionText']),
                  Answer(
                    ansQuestion,
                    questions[_questionIndex]['Answer'][0]['text'],
                    questions[_questionIndex]['Answer'][0]['score'],
                  ),
                  Answer(
                    ansQuestion,
                    questions[_questionIndex]['Answer'][1]['text'],
                    questions[_questionIndex]['Answer'][1]['score'],
                  ),
                  Answer(
                    ansQuestion,
                    questions[_questionIndex]['Answer'][2]['text'],
                    questions[_questionIndex]['Answer'][2]['score'],
                  ),
                  Answer(
                    ansQuestion,
                    questions[_questionIndex]['Answer'][3]['text'],
                    questions[_questionIndex]['Answer'][3]['score'],
                  ),
                ],
              )
            : Center(
                child: Column(
                  children: [
                    Text(
                      _totalScore.toString(),
                    ),
                    TextButton(
                      onPressed: _resetQuiz,
                      child: Text('restart the quiz'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
