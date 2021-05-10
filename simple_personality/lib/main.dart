import 'package:flutter/material.dart';
import 'package:simple_personality/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends StatefulWidget {
  var _questions = const[
    {
      'questionText': 'What\'s your favorite color?',
      'answers':[
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 2},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 8},
        {'text': 'Wolf', 'score': 10},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Elephant', 'score': 5},
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Patricia', 'score': 10},
        {'text': 'Helena', 'score': 8},
        {'text': 'Gabriel', 'score': 2},
        {'text': 'Barbara', 'score': 5}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length){
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Personality App'),
      ),
      body: _questionIndex < _questions.length ? Quiz(
        answerQuestion: _answerQuestion,
        questionIndex: _questionIndex,
        questions: _questions,
      )
      : Result(_totalScore, _resetQuiz),
    ),
  };
}
}