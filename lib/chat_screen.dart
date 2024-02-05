// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

import 'chat_processor.dart';

class ChatMessage {
  late final String text;
  final bool isUserMessage;
  final Color backgroundColor;
  final String formattedDate;

  ChatMessage({
    required this.text,
    required this.isUserMessage,
    required this.backgroundColor,
    required this.formattedDate,
  });
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> chatHistory = [];
  final stt.SpeechToText _speech = stt.SpeechToText();
  final TextEditingController _textEditingController = TextEditingController();
  String recognizedText = '';
  bool isListening = false;
  FlutterTts flutterTts = FlutterTts();
  FlutterTts flutterTtsInput = FlutterTts();

  bool hasSpokenOutput = false;
  String lastSpokenOutput = '';

  String inputVoice = 'en-US-language';
  String outputVoice = 'en-US-language';
  Color inputColor = Colors.blue;
  Color outputColor = Colors.green;

  late ChatProcessor chatProcessor;

  @override
  void initState() {
    super.initState();
    chatProcessor = ChatProcessor(flutterTts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat History'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                return buildChatBubble(chatHistory[index], index);
              },
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Type your message...',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    onSubmitted: (text) {
                      // Reset the flag when the user sends a new message
                      hasSpokenOutput = false;
                      addMessage(text, isUserMessage: true);
                      processUserInput(text);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Reset the flag when the user sends a new message
                    hasSpokenOutput = false;
                    addMessage(_textEditingController.text,
                        isUserMessage: true);
                    processUserInput(_textEditingController.text);
                    _textEditingController.clear();
                  },
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () async {
                    await startListening();
                  },
                  tooltip:
                      'Voice Command', // Add a tooltip for the voice command
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  onPressed: () {
                    chatProcessor.speakOutput(recognizedText, addMessage);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChatBubble(ChatMessage message, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onLongPress: () {
          _showChatOptionsDialog(index);
        },
        child: Align(
          alignment: message.isUserMessage
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: message.backgroundColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onLongPress: () {
                    _showRenameInputDialog(index);
                  },
                  child: Text(
                    message.text,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  message.formattedDate,
                  style: const TextStyle(color: Colors.white70),
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  onPressed: () {
                    chatProcessor.speakInput(message.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void processUserInput(String text) {
    chatProcessor.processUserInput(
      text,
      _speakOutput,
      _speakInput,
      chatHistory,
      _textEditingController,
      context,
      inputColor,
      outputColor,
    );
  }

  void addMessage(String message,
      {bool isUserMessage = false, Color? backgroundColor}) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('HH:mm').format(now);
    ChatMessage chatMessage = ChatMessage(
      text: message,
      isUserMessage: isUserMessage,
      backgroundColor: backgroundColor ?? Colors.blue, // Default color is blue
      formattedDate: formattedDate,
    );
    setState(() {
      chatHistory.insert(0, chatMessage);
    });
  }

  Future<void> startListening() async {
    bool available = await _speech.initialize(onStatus: (status) {});

    if (available) {
      await _speech.listen(
        onResult: (result) {
          String text = result.recognizedWords;
          _textEditingController.text = text;
        },
      );
    } else {}
  }

  Future<void> _speakOutput(String text) async {
    chatProcessor.speakOutput(text, addMessage);
  }

  Future<void> _speakInput(String text) async {
    chatProcessor.speakInput(text);
  }

  void _showChatOptionsDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chat Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text('Rename'),
                onTap: () {
                  _showRenameInputDialog(index);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Delete'),
                onTap: () {
                  _deleteChat(index);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showRenameInputDialog(int index) {
    TextEditingController renameController =
        TextEditingController(text: chatHistory[index].text);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rename Input'),
          content: TextField(
            controller: renameController,
            onChanged: (newText) {
              // Handle changes to the new input text
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Create a new response for the renamed text
                String renamedText = renameController.text;
                addMessage(renamedText, isUserMessage: true);
                processUserInput(renamedText);

                // Update the input text in the chat history
                chatHistory[index].text = renamedText;

                Navigator.of(context).pop();
              },
              child: const Text('Rename'),
            ),
          ],
        );
      },
    );
  }

  void _deleteChat(int index) {
    setState(() {
      // Remove both input and output messages
      chatHistory.removeAt(index);

      // Ensure not to go out of bounds when removing the corresponding output message
      if (index < chatHistory.length && !chatHistory[index].isUserMessage) {
        chatHistory.removeAt(index);
      }
    });
  }
}
