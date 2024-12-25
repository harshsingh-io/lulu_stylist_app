// ai_chat_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:lulu_stylist_app/app/ai_chat_assistent/widgets/chat_message.dart';
import 'package:lulu_stylist_app/app/ai_chat_assistent/widgets/three_dots.dart';
import 'package:lulu_stylist_app/logic/api/chat/models/chat_message.dart';
import 'package:lulu_stylist_app/logic/api/chat/models/chat_session.dart';
import 'package:lulu_stylist_app/logic/bloc/chat/bloc/chat_bloc.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_spacing.dart';
import 'package:lulu_stylist_app/lulu_design_system/widgets/sa_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:line_icons/line_icons.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _sessionNameController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final Logger log = Logger(printer: PrettyPrinter());

  String? selectedContext;
  bool isCreatingNewSession = true;

  final List<Map<String, dynamic>> availableContexts = [
    {
      'label': 'Fashion Advice',
      'contextKey': 'fashion_advice',
      'options': {
        'include_style_preferences': true,
        'include_measurements': false,
        'include_wardrobe': false,
        'include_shopping_habits': false,
      }
    },
    {
      'label': 'Style Recommendations',
      'contextKey': 'style_recommendations',
      'options': {
        'include_style_preferences': true,
        'include_measurements': true,
        'include_wardrobe': false,
        'include_shopping_habits': false,
      }
    },
    {
      'label': 'Wardrobe Management',
      'contextKey': 'wardrobe_management',
      'options': {
        'include_style_preferences': false,
        'include_measurements': false,
        'include_wardrobe': true,
        'include_shopping_habits': false,
      }
    },
    {
      'label': 'Outfit Planning',
      'contextKey': 'outfit_planning',
      'options': {
        'include_style_preferences': true,
        'include_measurements': true,
        'include_wardrobe': true,
        'include_shopping_habits': true,
      }
    },
  ];

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(const ChatEvent.started());
  }

  void _showCreateSessionDialog() {
    setState(() {
      selectedContext = null;
      isCreatingNewSession = true;
    });
    context.read<ChatBloc>().add(const ChatEvent.started());
  }

  Widget _buildChatHistoryList(ScrollController controller) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return state.maybeWhen(
          sessionsLoaded: (sessions) => ListView.builder(
            controller: controller,
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              return ListTile(
                title: Text(session.sessionName ?? 'Chat ${index + 1}'),
                subtitle: Text(
                    'Created: ${session.createdAt.toString().substring(0, 16)}'),
                onTap: () {
                  context
                      .read<ChatBloc>()
                      .add(ChatEvent.loadHistory(session.sessionId));
                  setState(() {
                    isCreatingNewSession = false;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: LuluBrandColor.brandPrimary,
            title: Text(
              AppLocalizations.of(context).aiStylist,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            actions: [
              // Only show these buttons when not creating a new session
              if (!isCreatingNewSession) ...[
                IconButton(
                  icon: const Icon(LineIcons.plusCircle),
                  onPressed: () => setState(() => isCreatingNewSession = true),
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(LineIcons.history, color: Colors.white),
                  onPressed: _showChatHistory,
                ),
              ],
            ],
          ),
          body: isCreatingNewSession
              ? _buildSessionCreationUI()
              : _buildChatStateHandler(state),
        );
      },
    );
  }

  Widget _buildSessionCreationUI() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          TextField(
            controller: _sessionNameController,
            decoration: InputDecoration(
              labelText: 'Session Name (Optional)',
              hintText: 'Enter a name for this chat session',
            ),
          ),
          SizedBox(height: 20.h),
          Text('Select Context:', style: TextStyle(fontSize: 18.sp)),
          Wrap(
            spacing: 8.w,
            children: availableContexts.map((context) {
              return ChoiceChip(
                label: Text(context['label'] as String),
                selected: selectedContext == context['contextKey'],
                onSelected: (selected) {
                  setState(() {
                    selectedContext =
                        selected ? context['contextKey'] as String : null;
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20.h),
          LuluButton.primary(
            onPressed: selectedContext != null ? _createNewSession : null,
            label: 'Start Chat',
          ),
        ],
      ),
    );
  }

  void _createNewSession() {
    if (selectedContext == null) return;

    final selectedContextData = availableContexts.firstWhere(
      (context) => context['contextKey'] == selectedContext,
    );

    final contextOptions = {
      ...selectedContextData['options'] as Map<String, dynamic>,
      'context_type': selectedContextData['contextKey'],
      'session_name': _sessionNameController.text.isNotEmpty
          ? _sessionNameController.text
          : selectedContextData['label'],
    };

    context.read<ChatBloc>().add(ChatEvent.createSession(contextOptions));
    setState(() => isCreatingNewSession = false);
    _sessionNameController.clear();
  }

  void _showChatHistory() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return state.maybeWhen(
              sessionsLoaded: (sessions) => ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  final session = sessions[index];
                  return ListTile(
                    title: Text(session.sessionName ?? 'Chat ${index + 1}'),
                    subtitle: Text(session.createdAt.toString()),
                    onTap: () {
                      context
                          .read<ChatBloc>()
                          .add(ChatEvent.loadHistory(session.sessionId));
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }

  Widget _buildChatStateHandler(ChatState state) {
    return state.maybeWhen(
      initial: () => const Center(child: Text('Start a new chat session')),
      loading: () => const Center(child: CircularProgressIndicator()),
      historyLoaded: (session, isMessageSending) =>
          _buildChatInterface(session, isMessageSending),
      error: (failure) => Center(
        child: Text('Error: ${failure.toString()}'),
      ),
      sessionsLoaded: (sessions) => sessions.isEmpty
          ? const Center(child: Text('No chat sessions found'))
          : const Center(child: Text('Select a chat session')),
      orElse: () => const Center(child: Text('Something went wrong')),
    );
  }

  Widget _buildChatInterface(ChatSession session, bool isMessageSending) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF2F4),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.only(bottom: 8.h),
              reverse: false,
              itemCount: session.messages.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ChatMessageBubble(
                    message: ChatMessage(
                      content: "Hey, How may I help you today?",
                      role: 'assistant',
                      timestamp: DateTime.now(),
                    ),
                    isUser: false,
                  );
                }

                final messageIndex = index - 1;
                if (messageIndex >= session.messages.length) {
                  return const SizedBox.shrink();
                }

                final message = session.messages[messageIndex];
                // Skip empty messages or messages without content
                if (message.content.trim().isEmpty) {
                  return const SizedBox.shrink();
                }

                final isUser = message.role == 'user';
                return ChatMessageBubble(
                  message: message,
                  isUser: isUser,
                );
              },
            ),
          ),
          if (isMessageSending)
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                bottom: 16.h,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: ChatLoadingIndicator(),
              ),
            ),
          Container(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 8.h,
              bottom: MediaQuery.of(context).viewPadding.bottom + 8.h,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _messageController,
                      textInputAction: TextInputAction.send,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.2,
                      ),
                      minLines: 1,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.sp,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 0,
                        ),
                        isDense: true,
                      ),
                      onSubmitted: (text) {
                        if (text.trim().isNotEmpty) {
                          _sendMessage(session.sessionId);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 45.w,
                  height: 45.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E392A),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      LineIcons.paperPlane,
                      color: Colors.white,
                      size: 20,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (_messageController.text.trim().isNotEmpty) {
                        _sendMessage(session.sessionId);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Modified _sendMessage method to include auto-scroll
  void _sendMessage(String sessionId) {
    if (_messageController.text.trim().isEmpty) return;

    context.read<ChatBloc>().add(ChatEvent.sendMessage(
          sessionId,
          _messageController.text.trim(),
        ));

    _messageController.clear();

    // Auto-scroll to bottom after sending message
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildMessageInput(String sessionId) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 8.h,
        bottom: MediaQuery.of(context).viewPadding.bottom + 8.h,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end, // Align items to bottom
        children: [
          Expanded(
            child: Container(
              height: 45.h, // Fixed height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _messageController,
                textInputAction: TextInputAction.send,
                textAlignVertical:
                    TextAlignVertical.center, // Center text vertically
                style: TextStyle(
                  fontSize: 14.sp,
                  height: 1.2, // Adjust line height
                ),
                minLines: 1,
                maxLines: 1, // Restrict to single line
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 0, // Remove vertical padding
                  ),
                  isDense: true, // Make the input field more compact
                ),
                onSubmitted: (text) {
                  if (text.trim().isNotEmpty) {
                    _sendMessage(sessionId);
                  }
                },
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 45.w, // Match text field height
            height: 45.w,
            decoration: const BoxDecoration(
              color: Color(0xFF1E392A),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                LineIcons.paperPlane,
                color: Colors.white,
                size: 20,
              ),
              padding: EdgeInsets.zero, // Remove padding from icon
              onPressed: () {
                if (_messageController.text.trim().isNotEmpty) {
                  _sendMessage(sessionId);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _sessionNameController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
