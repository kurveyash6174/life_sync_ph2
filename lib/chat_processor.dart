import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChatProcessor {
  FlutterTts flutterTts;
  bool hasSpokenOutput = false;
  String lastSpokenOutput = '';

  ChatProcessor(
    this.flutterTts,
  );

  Future<void> processUserInput(
    String recognizedText,
    Function(String) speakOutput,
    Function(String) speakInput,
    chatHistory,
    TextEditingController textEditingController,
    BuildContext context,
    Color inputColor,
    Color outputColor,
  ) async {
    String text = recognizedText.toLowerCase();

    // Check for 'schedule' keyword
    if (text.contains('schedule now')) {
      await speakOutput("Tomorrow 20 am");
      return;
    }
    if (text.contains('name')) {
      await speakOutput("My name is John Doe.");
      return;
    }

    if (text.contains('date of birth')) {
      await speakOutput("I was born on January 1, 1990.");
      return;
    }

    if (text.contains('p of birth')) {
      await speakOutput("I was born in New York, USA.");
      return;
    }

    if (text.contains('nationality')) {
      await speakOutput("I am American.");
      return;
    }

    if (text.contains('gender')) {
      await speakOutput("I am male.");
      return;
    }

    if (text.contains('marital status')) {
      await speakOutput("I am single.");
      return;
    }

    if (text.contains('number of dependents')) {
      await speakOutput("I have 0 dependents.");
      return;
    }

    if (text.contains('education level')) {
      await speakOutput("I have a Bachelor's Degree in Computer Science.");
      return;
    }

    if (text.contains('field of study')) {
      await speakOutput("I studied Computer Science.");
      return;
    }

    if (text.contains('current job title')) {
      await speakOutput("I work as a Software Developer.");
      return;
    }

    if (text.contains('industry')) {
      await speakOutput("I work in the Information Technology industry.");
      return;
    }
// ... Previous code for handling responses for the first 11 data items

    if (text.contains('years of experience')) {
      await speakOutput("I have 5 years of professional experience.");
      return;
    }

    if (text.contains('languages spoken')) {
      await speakOutput("I can speak English and Spanish.");
      return;
    }

    if (text.contains('professional skills')) {
      await speakOutput(
          "My professional skills include programming and data analysis.");
      return;
    }

    if (text.contains('hobbies')) {
      await speakOutput("My hobbies include reading and hiking.");
      return;
    }

    if (text.contains('favorite book')) {
      await speakOutput("My favorite book is '1984' by George Orwell.");
      return;
    }

    if (text.contains('favorite movie')) {
      await speakOutput("My favorite movie is 'Inception'.");
      return;
    }

    if (text.contains('favorite music genre')) {
      await speakOutput("I enjoy listening to Rock music.");
      return;
    }

    if (text.contains('favorite food')) {
      await speakOutput("My favorite food is Italian Pasta.");
      return;
    }

    if (text.contains('dietary restrictions')) {
      await speakOutput("I don't have any dietary restrictions.");
      return;
    }
    // ... Previous code for handling responses for the first 20 data items

    if (text.contains('exercise habits')) {
      await speakOutput("I go to the gym three times a week for exercise.");
      return;
    }

    if (text.contains('favorite sports')) {
      await speakOutput("My favorite sport is basketball.");
      return;
    }

    if (text.contains('favorite travel destinations')) {
      await speakOutput("I love traveling to Japan and Italy.");
      return;
    }

    if (text.contains('places lived')) {
      await speakOutput("I have lived in New York and San Francisco.");
      return;
    }

    if (text.contains('dream vacation')) {
      await speakOutput("My dream vacation is a safari in Kenya.");
      return;
    }

    if (text.contains('favorite artist')) {
      await speakOutput("My favorite artist is Vincent van Gogh.");
      return;
    }

    if (text.contains('favorite band')) {
      await speakOutput("My favorite band is The Beatles.");
      return;
    }

    if (text.contains('political views')) {
      await speakOutput("I hold moderate political views.");
      return;
    }

    if (text.contains('religious views')) {
      await speakOutput("I am agnostic in my religious views.");
      return;
    }

// ... Previous code for handling responses for the first 30 data items

    if (text.contains('environmental concerns')) {
      await speakOutput(
          "I'm concerned about climate change and environmental conservation.");
      return;
    }

    if (text.contains('personal values')) {
      await speakOutput("Honesty and integrity are my core personal values.");
      return;
    }

    if (text.contains('learning interests')) {
      await speakOutput("I have a keen interest in machine learning.");
      return;
    }

    if (text.contains('recent books read')) {
      await speakOutput("I recently read 'Sapiens' by Yuval Noah Harari.");
      return;
    }

    if (text.contains('favorite tv shows')) {
      await speakOutput("One of my favorite TV shows is 'Stranger Things'.");
      return;
    }

    if (text.contains('favorite podcasts')) {
      await speakOutput("I enjoy listening to 'The Daily'.");
      return;
    }

    if (text.contains('technology interests')) {
      await speakOutput("I'm interested in blockchain technology.");
      return;
    }

    if (text.contains('pps You can\'t live without')) {
      await speakOutput("I can't live without WhatsApp and Google Maps.");
      return;
    }

    if (text.contains('favorite video games')) {
      await speakOutput("My favorite video game is 'The Legend of Zelda'.");
      return;
    }
    // Define responses using a map
    Map<String, String> responses = {
      'my name is': 'Welcome %s! How can I assist you today?',
      'i am': '%s, what is your surname?',
      'What is my name': '%s, what is your surname?',
      'tell me a joke':
          'Why did the programmer quit his job? Too many bugs in the code!',
      'where were you created':
          'I was created by OpenAI, a team of talented engineers and researchers.',
      'are you a morning person':
          "I don't sleep or wake up, so every time is a good time for me!",
      'what is your purpose':
          'My purpose is to assist and provide information to users.',
      'do you have any siblings':
          "No, I don't have siblings. I am a standalone chatbot.",
      'whats your favorite food':
          "I don't eat, but I think pizza is popular among humans!",
      'tell me something interesting':
          'Did you know that honey never spoils? Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3,000 years old and still perfectly edible!',
      'what languages do you speak':
          'I am proficient in many programming languages, and I understand and generate text in multiple human languages.',
      'can you dance':
          "I can't dance physically, but I can help you find dance tutorials!",
    };

    // Iterate through responses and check for a match
    for (String key in responses.keys) {
      if (text.startsWith(key)) {
        String responseTemplate = responses[key]!;
        String userName = _extractUserName(text, key);
        String response = responseTemplate.replaceAll('%s', userName);
        await speakOutput(response);

        // Exit the function after generating a response
        return;
      }
    }

    // If no match is found
    await speakOutput(
        "I'm sorry, I didn't understand that question. Please try asking something else.");
  }

  String _extractUserName(String input, String keyword) {
    // Extract the username from the input based on the keyword
    List<String> words = input.split(' ');
    if (words.length == 4 && keyword.contains('my name is')) {
      return words[3];
    } else if (words.length == 4 && keyword.contains('i am')) {
      return words[2];
    } else {
      return ''; // Return an empty string if the extraction is not successful
    }
  }

  Future<void> speakOutput(
      String text,
      Function(String, {bool isUserMessage, Color? backgroundColor})
          addMessage) async {
    if (!hasSpokenOutput || lastSpokenOutput != text) {
      await flutterTts.setLanguage('en-US'); // Change the language if needed
      await flutterTts.setPitch(1);
      await flutterTts.setSpeechRate(0.5);
      // Add a delay before speaking
      await Future.delayed(const Duration(milliseconds: 500));

      if (text.isNotEmpty) {
        await flutterTts.speak(text);
        hasSpokenOutput = true;
        lastSpokenOutput = text;
      }

      // Automatically send the message once speaking is complete
      addMessage(text,
          isUserMessage: false, backgroundColor: Colors.blueGrey.shade500);
    }
  }

  Future<void> speakInput(String text) async {
    await flutterTts.setLanguage('en-US'); // Change the language if needed
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }
}
