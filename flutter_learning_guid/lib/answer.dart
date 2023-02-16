

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selecthandlar;
  final String answerText;

  Answer(this.selecthandlar, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
        child: Text(answerText),
        onPressed: selecthandlar as Function(),
      ),
    );
  }
}
