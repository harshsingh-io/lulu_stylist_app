import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/app/bottom_navigation/user_home_screen.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_items.dart';
import 'package:lulu_stylist_app/constraint.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/remote/models/item.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

Logger log = Logger(printer: PrettyPrinter());

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => AiChatScreenState();
}

class AiChatScreenState extends State<AiChatScreen> {
  late final Gemini gemini;
  ChatMessage? botMessage;

  @override
  void initState() {
    super.initState();
    gemini = Gemini.init(apiKey: gemini_token);
    // _loadUserData();
    // _loadWardrobeData();
  }

  List<ChatMessage> _messageList = [];

  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'Abhishek', lastName: 'Verma');
  final ChatUser _geminiUser =
      ChatUser(id: '2', firstName: 'Gemini', lastName: 'Google');

  final TextEditingController _textController = TextEditingController();
  bool _isLoading = false; // To show loading indicator

  Future<Map<String, dynamic>> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userDataJson = prefs.getString('userDetails');

    if (userDataJson != null) {
      Map<String, dynamic> userData =
          json.decode(userDataJson) as Map<String, dynamic>;

      log.t('User Data: $userData');
      return userData;
    } else {
      // Handle the case where user data is not available
      return {};
    }
  }

  List<Item> _loadWardrobeData() {
    // Assuming you have access to the wardrobe items in your code
    List<Item> wardrobeItems = [
      ...tops,
      ...bottoms,
      ...shoes,
      ...accessories,
      ...innerWear,
      ...otherItems
    ];

    log.t('Wardrobe Items: $wardrobeItems');
    return wardrobeItems;
  }

  String _prepareContext(
      Map<String, dynamic> userData, List<Item> wardrobeItems) {
    // Extract necessary user details
    String userDetails = 'User Profile:\n';
    userDetails += 'Name: ${userData['userDetails']['name']}\n';
    userDetails += 'Age: ${userData['userDetails']['age']}\n';
    userDetails += 'Gender: ${userData['userDetails']['gender']}\n';
    userDetails += 'Location: ${userData['userDetails']['location']}\n';
    userDetails +=
        'Body Type: ${userData['userDetails']['bodyMeasurements']['bodyType']}\n';
    // Add more details as needed

    // Summarize wardrobe items
    String wardrobeSummary = 'Wardrobe Items:\n';
    for (var item in wardrobeItems) {
      wardrobeSummary +=
          '- ${item.name} (${item.category.name}): ${item.colors.join(', ')}\n';
    }

    // Combine user details and wardrobe summary
    String context = '$userDetails\n$wardrobeSummary';

    return context;
  }

  void _confirmClearChat() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Clear Chat'),
          content: Text('Are you sure you want to clear the chat history?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Clear'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                _clearChat(); // Call the method to clear chat
              },
            ),
          ],
        );
      },
    );
  }

  void _clearChat() {
    setState(() {
      _messageList.clear();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LuluBrandColor.brandWhite,
      appBar: AppBar(
        title: const Text(
          "Hey, How may I help you today?",
          style: TextStyle(
            color: LuluBrandColor.brandWhite,
          ),
        ),
        backgroundColor: LuluBrandColor.brandPrimary,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_sweep),
            tooltip: 'Clear Chat',
            color: LuluBrandColor.brandRed,
            onPressed: _isLoading ? null : _confirmClearChat,
          ),
        ],
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
                  key: ValueKey(
                      message.createdAt.toIso8601String()), // Use a unique key
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
                // IconButton(
                //   icon: Icon(Icons.image),
                //   onPressed: _sendImageMessage,
                // ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _textController,
                      maxLines: 20, // Maximum lines the TextField can expand to
                      minLines: 1, // Minimum lines to start with
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              16.0), // Optional: Rounded borders
                          borderSide: BorderSide(
                            color: LuluBrandColor
                                .brandPrimary, // Optional: Border color
                          ),
                        ),
                        contentPadding: EdgeInsets.all(
                            12.0), // Padding inside the TextField
                      ),
                      onSubmitted: (value) {
                        _handleSubmitted(value);
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: LuluBrandColor.brandPrimary,
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

  Future<void> _sendMessage(ChatMessage message) async {
    setState(() {
      _messageList.insert(0, message);
      _isLoading = true; // Show loading indicator
    });

    String question = message.text;

    // Retrieve user data and wardrobe data
    Map<String, dynamic> userData = await _loadUserData();
    List<Item> wardrobeItems = _loadWardrobeData();

    // Prepare context
    String context = _prepareContext(userData, wardrobeItems);

    // Combine context and question
    String prompt = '$context\n\nUser: $question';

    // Create a placeholder message for the Gemini response
    botMessage = ChatMessage(
      user: _geminiUser,
      createdAt: DateTime.now(),
      text: '',
    );

    setState(() {
      _messageList.insert(0, botMessage!);
    });

    // Listening to Gemini content generation stream
    gemini.streamGenerateContent(prompt).listen((event) {
      String newText = event.content?.parts
              ?.fold("", (previous, current) => "$previous${current.text}") ??
          "";

      // Update the botMessage text incrementally
      setState(() {
        if (botMessage != null) {
          botMessage!.text += newText; // Append new content
        }
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

  // void _sendImageMessage() async {
  //   final ImagePicker imagePicker = ImagePicker();
  //   final XFile? file =
  //       await imagePicker.pickImage(source: ImageSource.gallery);

  //   if (file != null) {
  //     ChatMessage chatMessage = ChatMessage(
  //         user: _currentUser,
  //         createdAt: DateTime.now(),
  //         text: "Who is in this picture?",
  //         medias: [
  //           ChatMedia(url: file.path, fileName: "", type: MediaType.image)
  //         ]);
  //     _sendMessage(chatMessage);
  //   }
  // }
}

// Define custom classes since DashChat is no longer used
class ChatMessage extends Equatable {
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

  @override
  List<Object?> get props => [user.id, createdAt];
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
