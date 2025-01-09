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

    context.read<ChatBloc>().add(const ChatEvent.loadSessions());
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
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    LuluBrandColor.brandSecondary,
                    LuluBrandColor.expertDashBoardGreen,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            title: Text(
              AppLocalizations.of(context).aiStylist,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: LuluBrandColor.brandWhite,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              // Only show these buttons when not creating a new session
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
          ),
          backgroundColor: LuluBrandColor.brandWhite,
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
              hintText: 'Session Name (Optional)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'How should I help you today?',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 24.h),
          Column(
            children: availableContexts
                .map((context) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: InkWell(
                        onTap: () => setState(() {
                          selectedContext = context['contextKey'] as String;
                        }),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          decoration: BoxDecoration(
                            color: _getContextColor(context['label'] as String),
                            borderRadius: BorderRadius.circular(24),
                            border: selectedContext == context['contextKey']
                                ? Border.all(
                                    color: const Color(0xFF1B3B1B), width: 2)
                                : null,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _getContextIcon(context['label'] as String),
                              SizedBox(width: 8.w),
                              Text(
                                context['label'] as String,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedContext != null ? _createNewSession : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B3B1B),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Start Chat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getContextColor(String label) {
    switch (label) {
      case 'Fashion Advice':
        return Colors.pink[100]!;
      case 'Style Recommendations':
        return Colors.purple[100]!;
      case 'Wardrobe Management':
        return Colors.blue[100]!;
      case 'Outfit Planning':
        return Colors.green[100]!;
      default:
        return Colors.grey[100]!;
    }
  }

  Widget _getContextIcon(String label) {
    switch (label) {
      case 'Fashion Advice':
        return const Icon(Icons.auto_awesome);
      case 'Style Recommendations':
        return const Icon(Icons.shopping_bag);
      case 'Wardrobe Management':
        return const Icon(Icons.shopping_bag);
      case 'Outfit Planning':
        return const Icon(Icons.auto_awesome);
      default:
        return const Icon(Icons.flash_on);
    }
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
    final chatBloc = context.read<ChatBloc>();
    chatBloc.add(const ChatEvent.loadSessions());

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (modalContext) {
        return BlocProvider.value(
          value: chatBloc,
          child: SafeArea(
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(modalContext).size.height * 0.75),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chat Sessions',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(modalContext),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Flexible(
                    child: BlocBuilder<ChatBloc, ChatState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          sessionsLoaded: (sessions) {
                            if (sessions.isEmpty) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 32.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        LineIcons.comment,
                                        size: 48.sp,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 16.h),
                                      Text(
                                        'No chat sessions yet',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }

                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              itemCount: sessions.length,
                              separatorBuilder: (context, index) => Divider(
                                height: 1,
                                indent: 16.w,
                                endIndent: 16.w,
                              ),
                              itemBuilder: (context, index) {
                                final session = sessions[index];
                                final isCurrentSession =
                                    chatBloc.currentSessionId ==
                                        session.sessionId;

                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: isCurrentSession
                                        ? LuluBrandColor.brandPrimary
                                        : Colors.grey[200],
                                    child: Icon(
                                      LineIcons.comments,
                                      color: isCurrentSession
                                          ? Colors.white
                                          : LuluBrandColor.brandPrimary,
                                    ),
                                  ),
                                  title: Text(
                                    session.sessionName ?? 'Chat ${index + 1}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: isCurrentSession
                                          ? LuluBrandColor.brandPrimary
                                          : null,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Created: ${session.createdAt.toString().substring(0, 16)}',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: Colors.grey[400],
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          chatBloc.add(
                                            ChatEvent.deleteSession(
                                                session.sessionId),
                                          );
                                          Navigator.pop(modalContext);
                                        },
                                      ),
                                      Icon(
                                        LineIcons.angleRight,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      isCreatingNewSession = false;
                                    });
                                    Navigator.pop(modalContext);
                                    // Load history after modal is closed
                                    chatBloc.add(
                                      ChatEvent.loadHistory(session.sessionId),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          error: (failure) => Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 48.sp,
                                    color: Colors.red,
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    'Error loading sessions: ${failure.toString()}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          orElse: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ),
                  // Add this after the Flexible widget in _showChatHistory
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        icon:
                            const Icon(Icons.delete_forever, color: Colors.red),
                        label: Text(
                          'Clear All History',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                          ),
                        ),
                        onPressed: () {
                          showDialog<void>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Clear All History'),
                              content: const Text(
                                'Are you sure you want to delete all chat sessions? This action cannot be undone.',
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                TextButton(
                                  child: const Text(
                                    'Delete All',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    chatBloc.add(
                                        const ChatEvent.deleteAllSessions());
                                    Navigator.pop(context); // Close dialog
                                    Navigator.pop(
                                        modalContext); // Close bottom sheet
                                    setState(() {
                                      isCreatingNewSession = true;
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LuluButton.primary(
                    onPressed: _showChatHistory,
                    label: 'Select a chat session',
                  ),
                  LuluButton.primary(
                    onPressed: () =>
                        setState(() => isCreatingNewSession = true),
                    label: 'Create a new chat session',
                  ),
                ],
              ),
            ),
      orElse: () => const Center(child: Text('Something went wrong')),
    );
  }

  Widget _buildChatInterface(ChatSession session, bool isMessageSending) {
    return Scaffold(
      backgroundColor: LuluBrandColor.brandWhite,
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

                final messageIndex = index;
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
              color: LuluBrandColor.brandLightBackground.withOpacity(0.95),
              border: Border(
                top: BorderSide(
                  color: LuluBrandColor.brandGrey200,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 45.h,
                      maxHeight: 120.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _messageController,
                      textInputAction: TextInputAction.newline,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.4,
                        color: LuluBrandColor.brandBlack,
                      ),
                      minLines: 1,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Type your message here...',
                        hintStyle: TextStyle(
                          color: LuluBrandColor.brandGrey300,
                          fontSize: 14.sp,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
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
                SizedBox(width: 12.w),
                Container(
                  width: 45.w,
                  height: 45.w,
                  decoration: BoxDecoration(
                    color: LuluBrandColor.brandPrimary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: LuluBrandColor.brandPrimary.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(22.5),
                      onTap: () {
                        FocusScope.of(context).unfocus(); // Close keyboard
                        if (_messageController.text.trim().isNotEmpty) {
                          _sendMessage(session.sessionId);
                        }
                      },
                      child: const Icon(
                        LineIcons.arrowRight,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
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
