import 'package:flutter/material.dart';
import 'question.dart';

class QuestionTile extends StatelessWidget {
  final Question question;

  const QuestionTile({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(question.text),
      subtitle: Text('Answered: ${question.answered ? 'Yes' : 'No'}'),
    );
  }
}
