import 'package:flutter/material.dart';
import 'package:life_sync_ph2/profile/questions_and_hints.dart';
import 'question_screen.dart';
import 'question.dart';

class ProfileScreenData extends StatefulWidget {
  const ProfileScreenData({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenDataState createState() => _ProfileScreenDataState();
}

class _ProfileScreenDataState extends State<ProfileScreenData> {
  List<Question> questions = [];
  int completedQuestionCount = 0;

  void updateCompleteQuestionCount() {
    setState(() {
      completedQuestionCount++;
    });
  }

  double calculatePercentage() {
    if (questions.isEmpty) {
      return 0.0;
    }

    return (completedQuestionCount / questions.length) * 100;
  }

  @override
  void initState() {
    super.initState();
    questions = questionsAndHints.keys.map((questionText) {
      return Question(questionText, 0);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Questions'),
        backgroundColor: Colors.purple.shade100,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index].text),
            subtitle:
                Text('Answered: ${questions[index].answered ? 'Yes' : 'No'}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionScreen(
                    question: questions[index],
                    hint: questionsAndHints[questions[index].text]!,
                    onAnswered: updateCompleteQuestionCount,
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Total Completed Questions: $completedQuestionCount',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Completion: ${calculatePercentage().toStringAsFixed(1)}%',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
