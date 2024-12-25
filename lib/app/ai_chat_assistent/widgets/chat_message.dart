import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lulu_stylist_app/app/ai_chat_assistent/widgets/three_dots.dart';
import 'package:lulu_stylist_app/logic/api/chat/models/chat_message.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_spacing.dart';

// Add this class for the loading indicator

class ChatLoadingIndicator extends StatelessWidget {
  const ChatLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'AI is typing',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(width: 8.w),
          const ThreeDots(
            size: 6,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}

class ChatMessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isUser;

  const ChatMessageBubble({
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.75.sw),
        margin: EdgeInsets.only(
          left: isUser ? 64.w : 16.w,
          right: isUser ? 16.w : 64.w,
          top: 4.h,
          bottom: 4.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xFF1E392A) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isUser ? 16 : 4),
            topRight: Radius.circular(isUser ? 4 : 16),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
          ),
          boxShadow: [
            if (!isUser)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
          ],
        ),
        child: MarkdownBody(
          data: message.content,
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(
              color: isUser ? Colors.white : Colors.black87,
              fontSize: 15.sp,
            ),
            listBullet: TextStyle(
              color: isUser ? Colors.white : Colors.black87,
            ),
            strong: TextStyle(
              color: isUser ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            em: TextStyle(
              color: isUser ? Colors.white : Colors.black87,
              fontStyle: FontStyle.italic,
            ),
          ),
          selectable: true,
        ),
      ),
    );
  }
}
