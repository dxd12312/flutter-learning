import 'package:flutter/material.dart';
import 'package:flutter_learning_guid/answer.dart';
import 'package:flutter_learning_guid/question.dart';
import 'package:flutter_learning_guid/quiz.dart';
import 'package:flutter_learning_guid/result.dart';

// void main() {
//   runApp(MyApp());
//  }
//Dart有效写法
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var  _totalScore = 0;

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print("No more questions!");
    }
  }

  void _resultQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = [
    {
      'questionText': 'what\'s is your favourite music?',
      'answers': [{'text':'Beatiful Girl', 'score': 10}, {'text':'Good Boy','score': 8}, {'text':'Summer Day','score': 4}, {'text':'Spring Day','score': 1}]
    },
    {
      'questionText': 'what\'s is your favourite food?',
      'answers': [{'text':'Food', 'score': 4}, {'text':'Hot Dog','score': 9}, {'text':'Meet','score': 11}, {'text':'Fruit','score': 6}]
    },
    {
      'questionText': 'what\'s is your favourite fruit?',
      'answers': [{'text':'Banana', 'score': 1}, {'text':'Apple','score': 5}, {'text':'Group','score': 7}, {'text':'Pie','score': 8}]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore,_resultQuiz)
      ),
    );
  }
}
