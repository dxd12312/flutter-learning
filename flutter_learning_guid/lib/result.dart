import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resultQuiz;
  Result(this.resultScore, this.resultQuiz);

  String get resultParse {
    var reslutText;
    if (resultScore <= 8) {
      reslutText = '你很聪明和乐观';
    } else if (resultScore <= 12) {
      reslutText = '好像还不错';
    } else if (resultScore <= 16) {
      reslutText = '你有点沮丧';
    } else {
      reslutText = '你看起来很糟糕';
    }
    return reslutText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultParse,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // TextButton(
          //   onPressed: () {},
          //   child: Text('Restart Quiz'),
          // )
          ElevatedButton(
            onPressed: resultQuiz as Function(),
            child: Text('Restart Quiz'),
          )
        ],
      ),
    );
  }
}
