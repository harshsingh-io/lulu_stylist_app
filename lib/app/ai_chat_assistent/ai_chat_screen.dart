import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lulu_stylist_app/constraint.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => AiChatScreenState();
}

class AiChatScreenState extends State<AiChatScreen> {
  late final Gemini gemini;

  @override
  void initState() {
    super.initState();
    gemini = Gemini.init(apiKey: gemini_token);
  }

  List<ChatMessage> _messageList = [];

  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'Abhishek', lastName: 'Verma');
  final ChatUser _geminiUser =
      ChatUser(id: '2', firstName: 'Gemini', lastName: 'Google');

  final TextEditingController _textController = TextEditingController();
  bool _isLoading = false; // To show loading indicator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "How may I help you today?",
          style: TextStyle(
            color: LuluBrandColor.brandWhite,
          ),
        ),
        backgroundColor: LuluBrandColor.brandPrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // To display the latest messages at the bottom
              itemCount: _messageList.length,
              itemBuilder: (context, index) {
                ChatMessage message = _messageList[index];
                bool isCurrentUser = message.user.id == _currentUser.id;

                return Container(
                  alignment: isCurrentUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: isCurrentUser
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      if (message.medias != null && message.medias!.isNotEmpty)
                        Image.file(File(message.medias!.first.url)),
                      Container(
                        decoration: BoxDecoration(
                          color: isCurrentUser
                              ? LuluBrandColor.brandPrimary
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: MarkdownBody(
                          data: message.text,
                          styleSheet: MarkdownStyleSheet(
                            p: TextStyle(
                              color:
                                  isCurrentUser ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: _sendImageMessage,
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Type a message'),
                    onSubmitted: (value) {
                      _handleSubmitted(value);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _handleSubmitted(_textController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;

    _textController.clear();

    ChatMessage message = ChatMessage(
      user: _currentUser,
      createdAt: DateTime.now(),
      text: text,
    );

    _sendMessage(message);
  }

  void _sendMessage(ChatMessage message) {
    setState(() {
      _messageList.insert(0, message);
      _isLoading = true; // Show loading indicator
    });

    String question = message.text;

    // Create a placeholder message for the Gemini response
    ChatMessage botMessage = ChatMessage(
      user: _geminiUser,
      createdAt: DateTime.now(),
      text: '',
    );

    setState(() {
      _messageList.insert(0, botMessage);
    });

    // Listening to Gemini content generation stream
    gemini.streamGenerateContent(question).listen((event) {
      String newText = event.content?.parts
              ?.fold("", (previous, current) => "$previous${current.text}") ??
          "";

      // Update the botMessage text
      setState(() {
        botMessage.text = newText;
      });
    }, onError: (e) {
      print("Error: $e");
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }, onDone: () {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    });
  }

  void _sendImageMessage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? file =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
          user: _currentUser,
          createdAt: DateTime.now(),
          text: "Who is in this picture?",
          medias: [
            ChatMedia(url: file.path, fileName: "", type: MediaType.image)
          ]);
      _sendMessage(chatMessage);
    }
  }
}

// Define custom classes since DashChat is no longer used
class ChatMessage {
  final ChatUser user;
  final DateTime createdAt;
  String text; // Made mutable to update the text
  final List<ChatMedia>? medias;

  ChatMessage({
    required this.user,
    required this.createdAt,
    required this.text,
    this.medias,
  });
}

class ChatUser {
  final String id;
  final String firstName;
  final String lastName;

  ChatUser({
    required this.id,
    required this.firstName,
    required this.lastName,
  });
}

class ChatMedia {
  final String url;
  final String fileName;
  final MediaType type;

  ChatMedia({
    required this.url,
    required this.fileName,
    required this.type,
  });
}

enum MediaType { image, video, file }
