import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF1B3B1B),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B3B1B)),
      ),
      home: const ChatInterface(),
    );
  }
}

class Message {
  final String type;
  final String content;
  Message({required this.type, required this.content});
}

class QuickAction {
  final String label;
  final IconData icon;
  final Color color;
  QuickAction({required this.label, required this.icon, required this.color});
}

class ChatInterface extends StatefulWidget {
  const ChatInterface({super.key});

  @override
  State<ChatInterface> createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  List<Message> messages = [];
  bool isTyping = false;
  String sessionName = '';
  final TextEditingController _messageController = TextEditingController();

  final List<QuickAction> quickActions = [
    QuickAction(
      label: 'Fashion Advice',
      icon: Icons.auto_awesome,
      color: Colors.pink.shade100,
    ),
    QuickAction(
      label: 'Style Recommendations',
      icon: Icons.shopping_bag,
      color: Colors.purple.shade100,
    ),
    QuickAction(
      label: 'Wardrobe Management',
      icon: Icons.shopping_bag,
      color: Colors.blue.shade100,
    ),
    QuickAction(
      label: 'Outfit Planning',
      icon: Icons.auto_awesome,
      color: Colors.green.shade100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: const Color(0xFF1B3B1B),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                  const Text(
                    'AI Stylist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.history, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          // Chat Content
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: messages.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              hintText: 'Session Name (Optional)',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) =>
                                setState(() => sessionName = value),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'How should I help you today?',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 24),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                children: quickActions
                                    .map((action) => ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minWidth: constraints.maxWidth < 600
                                                ? constraints.maxWidth
                                                : (constraints.maxWidth - 16) /
                                                    2,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: action.color,
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                onTap: () {},
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20,
                                                      vertical: 16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center, // Center the content horizontally
                                                    children: [
                                                      Icon(action.icon,
                                                          size: 20,
                                                          color:
                                                              Colors.black87),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        action.label,
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: messages.length + (isTyping ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == messages.length && isTyping) {
                          return const _TypingIndicator();
                        }
                        final message = messages[index];
                        return _MessageBubble(message: message);
                      },
                    ),
            ),
          ),

          // Input Area
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message here...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B3B1B),
                    minimumSize: const Size(48, 48),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('AI is typing'),
        const SizedBox(width: 8),
        ...List.generate(
          3,
          (index) => Container(
            width: 4,
            height: 4,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Message message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.type == 'user' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              message.type == 'user' ? const Color(0xFF1B3B1B) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (message.type == 'ai')
              const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/ai-avatar.png'),
              ),
            const SizedBox(width: 8),
            Text(
              message.content,
              style: TextStyle(
                color: message.type == 'user' ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
