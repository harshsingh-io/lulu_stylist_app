// import 'dart:convert';
// import 'dart:io';

// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:http/http.dart' as http; // Added
// import 'package:image_picker/image_picker.dart';
// import 'package:logger/logger.dart';
// import 'package:lulu_stylist_app/app/bottom_navigation/user_home_screen.dart';
// import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_items.dart';
// import 'package:lulu_stylist_app/constraint.dart';
// import 'package:lulu_stylist_app/logic/api/wardrobe/models/item.dart';
// import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Logger log = Logger(printer: PrettyPrinter());

// // Add your OpenAI API key here securely
// const String openAI_API_KEY = gpt_token;

// class AiChatScreen extends StatefulWidget {
//   const AiChatScreen({super.key});

//   @override
//   State<AiChatScreen> createState() => AiChatScreenState();
// }

// class AiChatScreenState extends State<AiChatScreen> {
//   ChatMessage? botMessage;

//   @override
//   void initState() {
//     super.initState();
//   }

//   List<ChatMessage> _messageList = [];

//   final ChatUser _currentUser =
//       ChatUser(id: '1', firstName: 'Abhishek', lastName: 'Verma');
//   final ChatUser _chatGPTUser =
//       ChatUser(id: '2', firstName: 'ChatGPT', lastName: 'OpenAI');

//   final TextEditingController _textController = TextEditingController();
//   bool _isLoading = false; // To show loading indicator

//   Future<Map<String, dynamic>> _loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? userDataJson = prefs.getString('userDetails');

//     if (userDataJson != null) {
//       Map<String, dynamic> userData =
//           json.decode(userDataJson) as Map<String, dynamic>;

//       log.t('User Data: $userData');
//       return userData;
//     } else {
//       // Handle the case where user data is not available
//       return {};
//     }
//   }

//   List<Item> _loadWardrobeData() {
//     // Assuming you have access to the wardrobe items in your code
//     List<Item> wardrobeItems = [
//       ...tops,
//       ...bottoms,
//       ...shoes,
//       ...accessories,
//       ...innerWear,
//       ...otherItems
//     ];

//     log.t('Wardrobe Items: $wardrobeItems');
//     return wardrobeItems;
//   }

//   String _prepareContext(
//       Map<String, dynamic> userData, List<Item> wardrobeItems) {
//     // Extract necessary user details
//     String userDetails = 'User Profile:\n';
//     userDetails += 'Name: ${userData['userDetails']['name']}\n';
//     userDetails += 'Age: ${userData['userDetails']['age']}\n';
//     userDetails += 'Gender: ${userData['userDetails']['gender']}\n';
//     userDetails += 'Location: ${userData['userDetails']['location']}\n';
//     userDetails +=
//         'Body Type: ${userData['userDetails']['bodyMeasurements']['bodyType']}\n';
//     // Add more details as needed

//     // Summarize wardrobe items
//     String wardrobeSummary = 'Wardrobe Items:\n';
//     for (var item in wardrobeItems) {
//       wardrobeSummary +=
//           '- ${item.name} (${item.category.name}): ${item.colors.join(', ')}\n';
//     }

//     // Combine user details and wardrobe summary
//     String context = '$userDetails\n$wardrobeSummary';

//     return context;
//   }

//   void _confirmClearChat() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Clear Chat'),
//           content: Text('Are you sure you want to clear the chat history?'),
//           actions: [
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Dismiss the dialog
//               },
//             ),
//             TextButton(
//               child: Text('Clear'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Dismiss the dialog
//                 _clearChat(); // Call the method to clear chat
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _clearChat() {
//     setState(() {
//       _messageList.clear();
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: LuluBrandColor.brandWhite,
//       appBar: AppBar(
//         title: const Text(
//           "Hey, How may I help you today?",
//           style: TextStyle(
//             color: LuluBrandColor.brandWhite,
//           ),
//         ),
//         backgroundColor: LuluBrandColor.brandPrimary,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.delete_sweep),
//             tooltip: 'Clear Chat',
//             color: LuluBrandColor.brandRed,
//             onPressed: _isLoading ? null : _confirmClearChat,
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true, // To display the latest messages at the bottom
//               itemCount: _messageList.length,
//               itemBuilder: (context, index) {
//                 ChatMessage message = _messageList[index];
//                 bool isCurrentUser = message.user.id == _currentUser.id;

//                 return Container(
//                   key: ValueKey(
//                       message.createdAt.toIso8601String()), // Use a unique key
//                   alignment: isCurrentUser
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   child: Column(
//                     crossAxisAlignment: isCurrentUser
//                         ? CrossAxisAlignment.end
//                         : CrossAxisAlignment.start,
//                     children: [
//                       if (message.medias != null && message.medias!.isNotEmpty)
//                         Image.file(File(message.medias!.first.url)),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: isCurrentUser
//                               ? LuluBrandColor.brandPrimary
//                               : Colors.grey[300],
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         padding: EdgeInsets.all(12),
//                         child: MarkdownBody(
//                           data: message.text,
//                           styleSheet: MarkdownStyleSheet(
//                             p: TextStyle(
//                               color:
//                                   isCurrentUser ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           if (_isLoading)
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: CircularProgressIndicator(),
//             ),
//           Divider(height: 1),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 8),
//             color: Colors.white,
//             child: Row(
//               children: [
//                 // IconButton(
//                 //   icon: Icon(Icons.image),
//                 //   onPressed: _sendImageMessage,
//                 // ),
//                 SizedBox(
//                   width: 6,
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: _textController,
//                       maxLines: 20, // Maximum lines the TextField can expand to
//                       minLines: 1, // Minimum lines to start with
//                       decoration: InputDecoration(
//                         hintText: 'Type a message',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                               16.0), // Optional: Rounded borders
//                           borderSide: BorderSide(
//                             color: LuluBrandColor
//                                 .brandPrimary, // Optional: Border color
//                           ),
//                         ),
//                         contentPadding: EdgeInsets.all(
//                             12.0), // Padding inside the TextField
//                       ),
//                       onSubmitted: (value) {
//                         _handleSubmitted(value);
//                       },
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   color: LuluBrandColor.brandPrimary,
//                   onPressed: () {
//                     _handleSubmitted(_textController.text);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _handleSubmitted(String text) {
//     if (text.trim().isEmpty) return;

//     _textController.clear();

//     ChatMessage message = ChatMessage(
//       user: _currentUser,
//       createdAt: DateTime.now(),
//       text: text,
//     );

//     _sendMessage(message);
//   }

//   Future<void> _sendMessage(ChatMessage message) async {
//     setState(() {
//       _messageList.insert(0, message);
//       _isLoading = true; // Show loading indicator
//     });

//     String question = message.text;

//     // Retrieve user data and wardrobe data
//     Map<String, dynamic> userData = await _loadUserData();
//     List<Item> wardrobeItems = _loadWardrobeData();

//     // Prepare context
//     String context = _prepareContext(userData, wardrobeItems);

//     // Construct the prompt with instructions
//     String prompt = '''
// You are a friendly and helpful assistant. When responding to the user, please:

// 1. Greet the user warmly.
// 2. Provide detailed results based on the provided context.
// 3. Offer additional suggestions or recommendations related to the results.

// Context:
// $context

// User: $question
// Assistant:
// ''';

//     // Create a placeholder message for the ChatGPT response
//     botMessage = ChatMessage(
//       user: _chatGPTUser,
//       createdAt: DateTime.now(),
//       text: '',
//     );

//     setState(() {
//       _messageList.insert(0, botMessage!);
//     });

//     try {
//       // Make the API call
//       final response = await http.post(
//         Uri.parse('https://api.openai.com/v1/chat/completions'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $openAI_API_KEY',
//         },
//         body: jsonEncode({
//           'model': 'gpt-4', // or 'gpt-3.5-turbo'
//           'messages': [
//             {'role': 'system', 'content': 'You are a helpful assistant.'},
//             {'role': 'user', 'content': prompt},
//           ],
//           'max_tokens': 500, // Adjust as needed
//           'temperature': 0.7, // Adjust for creativity
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         String assistantReply =
//             data['choices'][0]['message']['content'] as String;

//         setState(() {
//           if (botMessage != null) {
//             botMessage!.text = assistantReply.trim();
//           }
//           _isLoading = false;
//         });
//       } else {
//         // Handle errors
//         log.e('OpenAI API Error: ${response.statusCode} ${response.body}');
//         setState(() {
//           if (botMessage != null) {
//             botMessage!.text =
//                 'Sorry, I encountered an error while processing your request.';
//           }
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       log.e('Exception: $e');
//       setState(() {
//         if (botMessage != null) {
//           botMessage!.text =
//               'Sorry, something went wrong. Please try again later.';
//         }
//         _isLoading = false;
//       });
//     }
//   }

//   // Uncomment and implement if you want to handle image messages
//   // void _sendImageMessage() async {
//   //   final ImagePicker imagePicker = ImagePicker();
//   //   final XFile? file =
//   //       await imagePicker.pickImage(source: ImageSource.gallery);

//   //   if (file != null) {
//   //     ChatMessage chatMessage = ChatMessage(
//   //         user: _currentUser,
//   //         createdAt: DateTime.now(),
//   //         text: "Who is in this picture?",
//   //         medias: [
//   //           ChatMedia(url: file.path, fileName: "", type: MediaType.image)
//   //         ]);
//   //     _sendMessage(chatMessage);
//   //   }
//   // }
// }

// // Define custom classes since DashChat is no longer used
// class ChatMessage extends Equatable {
//   final ChatUser user;
//   final DateTime createdAt;
//   String text; // Made mutable to update the text
//   final List<ChatMedia>? medias;

//   ChatMessage({
//     required this.user,
//     required this.createdAt,
//     required this.text,
//     this.medias,
//   });

//   @override
//   List<Object?> get props => [user.id, createdAt];
// }

// class ChatUser {
//   final String id;
//   final String firstName;
//   final String lastName;

//   ChatUser({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//   });
// }

// class ChatMedia {
//   final String url;
//   final String fileName;
//   final MediaType type;

//   ChatMedia({
//     required this.url,
//     required this.fileName,
//     required this.type,
//   });
// }

// enum MediaType { image, video, file }
import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:lulu_stylist_app/app/bottom_navigation/user_home_screen.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_items.dart';
import 'package:lulu_stylist_app/constraint.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/item.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

Logger log = Logger(printer: PrettyPrinter());

// Add your OpenAI API key here securely
const String openAI_API_KEY = gpt_token; // Ensure this is securely managed

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => AiChatScreenState();
}

class AiChatScreenState extends State<AiChatScreen> {
  ChatMessage? botMessage;

  bool _streamDone = false;

  List<ChatMessage> _messageList = [];

  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'Abhishek', lastName: 'Verma');
  final ChatUser _chatGPTUser =
      ChatUser(id: '2', firstName: 'ChatGPT', lastName: 'OpenAI');

  final TextEditingController _textController = TextEditingController();
  bool _isLoading = false; // To show loading indicator

  // Manage selected context
  String? _selectedContext;

  // Define available contexts
  final List<Map<String, String>> _availableContexts = [
    {'label': 'Related to Fashion', 'contextKey': 'wardrobe_items'},
    {'label': 'About you', 'contextKey': 'profile_details'},
    {'label': 'About Existing Looks & Styles', 'contextKey': 'looks_styles'},
  ];

  @override
  void initState() {
    super.initState();
    // Initializations if needed
  }

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

    // Combine user details and wardrobe summary based on selected context
    String context = '';

    if (_selectedContext == 'wardrobe_items') {
      context += '$wardrobeSummary\n';
    }

    if (_selectedContext == 'profile_details') {
      context += '$userDetails\n';
    }

    if (_selectedContext == 'looks_styles') {
      // Add logic to include user's looks and styles
      context += 'User Looks & Styles:\n';
      // Example: Add specific details or summaries
      context += 'User has a preference for casual and formal wear.\n';
    }

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
      _selectedContext = null; // Clear selected context
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LuluBrandColor.brandWhite,
      appBar: AppBar(
        title: const Text(
          "Lulu AI Stylist",
          style: TextStyle(
            color: LuluBrandColor.brandWhite,
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
          // Optional: Add a settings or context switch button
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            tooltip: 'Change Context',
            onPressed: () {
              _showChangeContextDialog();
            },
          ),
        ],
      ),
      body: _selectedContext == null
          ? _buildInitialContextSelection()
          : _buildChatInterface(),
    );
  }

  // Build Initial Context Selection UI
  Widget _buildInitialContextSelection() {
    return Container(
      color: Colors.white, // Match the initial UI background
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lottie/login_lottie.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'What can I help with?',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: LuluBrandColor.brandBlack,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildContextPills(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build Context Pills for Selection
  Widget _buildContextPills() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      alignment: WrapAlignment.center,
      children:
          _availableContexts.map((item) => _buildContextPill(item)).toList(),
    );
  }

  // Build Individual Context Pill
  Widget _buildContextPill(Map<String, String> item) {
    bool isSelected = _selectedContext == item['contextKey'];

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedContext = null; // Deselect if already selected
          } else {
            _selectedContext = item['contextKey'];
            // Automatically transition to chat interface
          }
        });

        if (!isSelected) {
          // Automatically initialize chat
          _initializeChat();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? LuluBrandColor.brandPrimary
              : LuluBrandColor.brandGrey300,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          item['label']!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Build Chat Interface
  Widget _buildChatInterface() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true, // To display the latest messages at the bottom
            itemCount: _messageList.length,
            itemBuilder: (context, index) {
              ChatMessage message = _messageList[index];
              bool isCurrentUser = message.user.id == _currentUser.id;

              return Container(
                key:
                    ValueKey(message.createdAt.toIso8601String()), // Unique key
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
                            color: isCurrentUser ? Colors.white : Colors.black,
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
                        borderRadius:
                            BorderRadius.circular(16.0), // Rounded borders
                        borderSide: BorderSide(
                          color: LuluBrandColor.brandPrimary, // Border color
                        ),
                      ),
                      contentPadding: EdgeInsets.all(12.0), // Padding inside
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
    );
  }

  // Initialize Chat after Context Selection
  void _initializeChat() {
    // Optionally, you can send an initial message or just transition to chat
    setState(() {
      // For example, send a welcome message based on contexts
      ChatMessage welcomeMessage = ChatMessage(
        user: _chatGPTUser,
        createdAt: DateTime.now(),
        text:
            'Hello! How can I assist you today with your selected preference?',
      );
      _messageList.insert(0, welcomeMessage);
    });
  }

  // Show Dialog to Change Contexts
  void _showChangeContextDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? tempSelectedContext = _selectedContext;
        return AlertDialog(
          title: Text('Select Context'),
          content: SingleChildScrollView(
            child: Column(
              children: _availableContexts.map((item) {
                bool isSelected = tempSelectedContext == item['contextKey'];
                return RadioListTile<String>(
                  title: Text(item['label']!),
                  value: item['contextKey']!,
                  groupValue: tempSelectedContext,
                  onChanged: (String? value) {
                    setState(() {
                      tempSelectedContext = value;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Apply'),
              onPressed: () {
                setState(() {
                  _selectedContext = tempSelectedContext;
                  _clearChat(); // Optionally clear chat on context change
                  if (_selectedContext != null) {
                    _initializeChat();
                  }
                });
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
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

  Future<void> _sendMessage(ChatMessage message, {int retryCount = 0}) async {
    setState(() {
      _messageList.insert(0, message);
      _isLoading = true; // Show loading indicator
      _streamDone = false; // Reset the stream completion flag
    });

    String question = message.text;

    // Retrieve user data and wardrobe data
    Map<String, dynamic> userData = await _loadUserData();
    List<Item> wardrobeItems = _loadWardrobeData();

    // Prepare context
    String context = _prepareContext(userData, wardrobeItems);

    // Construct the prompt with instructions
    String prompt = '''
You are a friendly and helpful assistant specializing in fashion and personal styling. When responding to the user, please:

1. Greet the user warmly.
2. Provide detailed results based on the provided context.
3. Offer additional suggestions or recommendations related to the results.

Context:
$context

User: $question
Assistant:
''';

    // Create a placeholder message for the ChatGPT response only if it's the first attempt
    if (retryCount == 0) {
      botMessage = ChatMessage(
        user: _chatGPTUser,
        createdAt: DateTime.now(),
        text: '',
      );

      setState(() {
        _messageList.insert(0, botMessage!);
      });
    }

    try {
      // Make the API call with streaming
      final client = http.Client();
      final request = http.Request(
        'POST',
        Uri.parse('https://api.openai.com/v1/chat/completions'),
      );

      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $openAI_API_KEY';

      request.body = jsonEncode({
        'model': 'gpt-4', // or 'gpt-3.5-turbo'
        'messages': [
          {
            'role': 'system',
            'content':
                'You are a friendly and helpful assistant specializing in fashion and personal styling.'
          },
          {'role': 'user', 'content': prompt},
        ],
        'max_tokens': 500, // Adjust as needed
        'temperature': 0.7, // Adjust for creativity
        'stream': true, // Enable streaming
      });

      final streamedResponse = await client.send(request);

      if (streamedResponse.statusCode == 200) {
        // Listen to the stream
        streamedResponse.stream
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .listen((line) {
          if (line.isEmpty) return;
          if (line.startsWith('data: ')) {
            final data = line.substring(6);
            if (data == '[DONE]') {
              setState(() {
                _isLoading = false;
                _streamDone = true; // Mark stream as done
              });
              client.close();
              return;
            }

            try {
              final jsonData = json.decode(data) as Map<String, dynamic>;

              if (jsonData.containsKey('error')) {
                // Handle API errors gracefully
                final error = jsonData['error'];
                log.e('OpenAI API Error: $error');
                setState(() {
                  if (botMessage != null) {
                    botMessage!.text =
                        'Sorry, I encountered an error while processing your request.';
                  }
                  _isLoading = false;
                });
                client.close();
                return;
              }

              final choices = jsonData['choices'];
              if (choices is List && choices.isNotEmpty) {
                final delta = choices[0]['delta'];
                if (delta is Map<String, dynamic> &&
                    delta.containsKey('content')) {
                  String content = delta['content'] as String;
                  setState(() {
                    if (botMessage != null) {
                      botMessage!.text += content;
                    }
                  });
                } else if (delta is Map<String, dynamic> && delta.isEmpty) {
                  // Empty delta received, possibly end of message
                  log.w('Received empty delta.');
                } else {
                  log.e('Unexpected delta format: $delta');
                  log.e('Full JSON Data: $jsonData'); // Log entire JSON data
                }
              } else {
                log.e('Invalid choices format: $choices');
              }
            } catch (e) {
              log.e('Error parsing stream data: $e');
            }
          }
        }, onDone: () {
          setState(() {
            _isLoading = false;
            _streamDone = true; // Mark stream as done
          });
          client.close();
        }, onError: (e) {
          log.e('Stream Error: $e');
          if (_streamDone) {
            // Ignore the error as the stream was closed normally
            log.w('Stream closed normally after [DONE]');
          } else {
            setState(() {
              if (botMessage != null) {
                botMessage!.text =
                    'Sorry, something went wrong. Please try again later.';
              }
              _isLoading = false;
            });

            // Retry logic only if not already retried 3 times
            if (retryCount < 3) {
              log.w('Retrying... Attempt ${retryCount + 1}');
              Future.delayed(Duration(seconds: 2), () {
                _sendMessage(message, retryCount: retryCount + 1);
              });
            }
          }
          client.close();
        });
      } else {
        // Handle non-200 responses
        log.e(
            'OpenAI API Error: ${streamedResponse.statusCode} ${streamedResponse.reasonPhrase}');
        setState(() {
          if (botMessage != null) {
            botMessage!.text =
                'Sorry, I encountered an error while processing your request.';
          }
          _isLoading = false;
        });

        // Retry logic only if not already retried 3 times
        if (retryCount < 3) {
          log.w('Retrying... Attempt ${retryCount + 1}');
          await Future.delayed(Duration(seconds: 2));
          await _sendMessage(message, retryCount: retryCount + 1);
        }
      }
    } catch (e) {
      log.e('Exception: $e');
      setState(() {
        if (botMessage != null) {
          botMessage!.text =
              'Sorry, something went wrong. Please try again later.';
        }
        _isLoading = false;
      });

      // Retry logic only if not already retried 3 times
      if (retryCount < 3) {
        log.w('Retrying... Attempt ${retryCount + 1}');
        await Future.delayed(Duration(seconds: 2));
        await _sendMessage(message, retryCount: retryCount + 1);
      }
    }
  }

  // Uncomment and implement if you want to handle image messages
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
