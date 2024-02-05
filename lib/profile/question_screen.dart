import 'package:flutter/material.dart';
import 'question.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;
  final String hint;
  final Function() onAnswered;

  const QuestionScreen(
      {super.key,
      required this.question,
      required this.hint,
      required this.onAnswered});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  TextEditingController answerController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
        backgroundColor: Colors.purple.shade100,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.question.text,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                widget.hint,
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: answerController,
                decoration: InputDecoration(
                  labelText: 'Your Answer',
                  hintText: 'Type your answer here',
                  // Optional hint text
                  errorText: errorMessage.isNotEmpty ? errorMessage : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.purple), // Border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: Colors.purple), // Focused border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: Colors.grey), // Enabled border color
                  ),
                  contentPadding: const EdgeInsets.all(
                      16.0), // Padding inside the text field
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (answerController.text.isEmpty) {
                    setState(() {
                      errorMessage = 'Please provide an answer.';
                    });
                  } else {
                    widget.question.answered = true;
                    widget.onAnswered();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit Answer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
