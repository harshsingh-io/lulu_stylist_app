// import 'dart:async';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:go_router/go_router.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:nanoid/nanoid.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:lulu_stylist_app/app/chat/widget.dart/message_bubble.dart';
// import 'package:lulu_stylist_app/app/navigation/route.dart' as route;
// import 'package:lulu_stylist_app/common_widget/sa_loading_indicator.dart';
// import 'package:lulu_stylist_app/logic/api/chat/models/base_message_model.dart';
// import 'package:lulu_stylist_app/logic/api/chat/models/message_model.dart';
// import 'package:lulu_stylist_app/logic/api/chat/models/thread_response_model.dart';
// import 'package:lulu_stylist_app/logic/blocs/accounts/auth/authentication_bloc.dart';
// import 'package:lulu_stylist_app/logic/blocs/chat/chat/chat_bloc.dart';
// import 'package:lulu_stylist_app/logic/blocs/mqtt/mqtt_bloc.dart';
// import 'package:lulu_stylist_app/logic/blocs/networks/network_bloc.dart';
// import 'package:lulu_stylist_app/sa_design_system/core/sa_colors.dart';
// import 'package:lulu_stylist_app/toast/sa_toast.dart';

// class ChatRoomScreen extends StatefulWidget with SU {
//   ChatRoomScreen({
//     super.key,
//     required this.threadId,
//   });
//   final String threadId;

//   @override
//   State<ChatRoomScreen> createState() => _ChatRoomScreenState();
// }

// class _ChatRoomScreenState extends State<ChatRoomScreen> {
//   final PagingController<DateTime, BaseMessageModel> _pagingController =
//       PagingController(firstPageKey: DateTime.now());

//   late ChatBloc chatBloc = ChatBloc(threadId: widget.threadId);

//   late StreamSubscription<ChatState> _chatRoomStateSubscription;
//   final inputMessageController = TextEditingController();
//   String senderId = '';
//   String recievedId = '';
//   final authenticationBloc = AuthenticationBloc();
//   late MqttBloc mqttBloc;
//   late NetworkBloc networkBloc;
//   late ThreadResponseModel threadResponseModel;
//   final List<BaseMessageModel> _realTimeMessages = [];
//   late StreamSubscription<AuthenticationState> _authenticationStateSubscription;
//   late StreamSubscription<MqttState> _mqttStateSubscription;
//   late StreamSubscription<NetworkState> _networkStateSubscription;
//   final audioCache = AudioCache();
//   bool _showChatTextField = true;
//   DateTime? topMessageTime;
//   DateTime? lastMessageTime;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     mqttBloc = MqttBloc();
//     networkBloc = NetworkBloc();
//     chatBloc = ChatBloc(threadId: widget.threadId);
//     chatBloc
//       ..add(ChatEvent.getThreadByThreadId(widget.threadId))
//       ..add(const ChatEvent.updateUnreadCountMessages());

//     _pagingController.addPageRequestListener(
//       (pageKey) {
//         chatBloc.add(
//           ChatEvent.getChatByThreadId(
//             threadId: widget.threadId,
//             page: 1,
//             pageSize: 100,
//             fromMessageTime: pageKey,
//             direction: 'before',
//           ),
//         );
//       },
//     );
//     _authenticationStateSubscription =
//         authenticationBloc.stream.listen(handleAuthStateChanges);
//     handleAuthStateChanges(authenticationBloc.state);
//     _chatRoomStateSubscription = chatBloc.stream.listen(handleChatStateChanges);
//     handleChatStateChanges(chatBloc.state);
//     _mqttStateSubscription = mqttBloc.stream.listen(handleMqttStateChanges);
//     handleMqttStateChanges(mqttBloc.state);
//     _networkStateSubscription =
//         networkBloc.stream.listen(handleNetworkStateChange);
//     handleNetworkStateChange(networkBloc.state);

//     _loadDraftMessage();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _mqttStateSubscription.cancel();
//     _chatRoomStateSubscription.cancel();
//     _authenticationStateSubscription.cancel();
//     _networkStateSubscription.cancel();
//     chatBloc.close();
//     _saveDraftMessage();
//     super.dispose();
//   }

//   Future<void> _saveDraftMessage() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(
//       'draft_message_${widget.threadId}',
//       inputMessageController.text,
//     );
//   }

//   Future<void> _loadDraftMessage() async {
//     final prefs = await SharedPreferences.getInstance();
//     final draftMessage = prefs.getString('draft_message_${widget.threadId}');
//     if (draftMessage != null && draftMessage.isNotEmpty) {
//       setState(() {
//         inputMessageController.text = draftMessage;
//       });
//     }
//   }

//   void handleAuthStateChanges(AuthenticationState state) {
//     state.maybeWhen(
//       userAuthenticated: (user, userAuth) {
//         setState(() {
//           senderId = user.id;
//         });
//       },
//       userLoggedIn: (user, authToken) {
//         setState(() {
//           senderId = user.id;
//         });
//       },
//       expertAuthenticated: (expert, authToken) {
//         setState(() {
//           senderId = expert.id;
//         });
//       },
//       expertLoggedIn: (expert, authToken) {
//         setState(() {
//           senderId = expert.id;
//         });
//       },
//       orElse: () {
//         setState(() {
//           senderId = 'Null';
//         });
//       },
//     );
//   }

//   void handleChatStateChanges(ChatState state) {
//     state.maybeWhen(
//       newMessageReceived: (message) {
//         playNotificationSound();
//         setState(() {
//           if (!_realTimeMessages.any((m) => m.id == message.id)) {
//             _realTimeMessages.insert(0, message);
//             if (_pagingController.itemList != null) {
//               _pagingController.itemList!.insert(0, message);
//             } else {
//               _pagingController.itemList = [message];
//             }
//           }
//         });
//       },
//       loadedThread: (thread) {
//         if (mounted) {
//           setState(() {
//             threadResponseModel = thread;
//             _isLoading = false; // Loading complete
//           });
//         }
//       },
//       messageStoredInLocal: (paginatedMessages) {
//         if (paginatedMessages.isEmpty) {
//           _pagingController.appendLastPage(
//             paginatedMessages,
//           );
//         } else {
//           _pagingController.appendPage(
//             paginatedMessages,
//             paginatedMessages.last.createdAt,
//           );
//         }
//       },
//       messagePublished: (publishedMessage) {
//         setState(() {
//           if (!_realTimeMessages.any((m) => m.id == publishedMessage.id)) {
//             _realTimeMessages.insert(0, publishedMessage);
//           }
//         });
//       },
//       errorLoading: () {
//         _pagingController.error = 'could not load chats';
//       },
//       orElse: () {},
//     );
//   }

//   void handleMqttStateChanges(MqttState state) {
//     state.maybeWhen(
//       connected: () {
//         Fluttertoast.cancel();
//       },
//       disconnected: () {
//         Fluttertoast.showToast(
//           msg: 'Disconnected from MQTT',
//           toastLength: Toast.LENGTH_LONG,
//           backgroundColor: Colors.red,
//         );
//       },
//       orElse: () {},
//     );
//   }

//   void handleNetworkStateChange(NetworkState state) {
//     state.maybeWhen(
//       success: () {
//         setState(() {
//           _showChatTextField = true;
//         });
//       },
//       failure: () {
//         setState(() {
//           _showChatTextField = false;
//         });
//       },
//       orElse: () {},
//     );
//   }

//   Future<void> playNotificationSound() async {
//     final player = AudioPlayer();
//     const volume = 0.5;
//     await player.setVolume(volume);
//     await player.play(AssetSource('audio/notification_audio.wav'));
//   }

//   void publishMessage(
//     String senderId,
//     String threadId,
//     String recievedId,
//     int messageType,
//     int status,
//   ) {
//     final message = BaseMessageModel(
//       id: nanoid(12),
//       senderId: senderId,
//       message: MessageModel(message: inputMessageController.text),
//       threadId: threadId,
//       messageType: messageType,
//       createdAt: DateTime.now(),
//       status: status,
//       isRead: false,
//     );
//     final receiverId = threadResponseModel.expert != null
//         ? threadResponseModel.expert!.id
//         : threadResponseModel.user!.id;

//     if (message.message.message.isNotEmpty) {
//       chatBloc.add(ChatEvent.publishMessage(message, receiverId));
//       _realTimeMessages.insert(0, message);
//       setState(() {
//         // Update the PagingController's item list directly if it's not null
//         if (_pagingController.itemList != null) {
//           _pagingController.itemList!.insert(0, message);
//         } else {
//           // Initialize the item list if it's null
//           _pagingController.itemList = [message];
//         }
//       });
//       inputMessageController.clear();
//       _saveDraftMessage();
//     } else {
//       LuluToast.showToast(
//         title: 'Message',
//         message: "It seems you haven't write anything",
//         contentType: ContentType.failure,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final localizations = AppLocalizations.of(context)!;

//     final combinedList = <BaseMessageModel>[..._realTimeMessages];
//     if (_pagingController.itemList != null) {
//       combinedList.addAll(_pagingController.itemList!);
//     }

//     if (_isLoading) {
//       // Show loading indicator if in loading state
//       return const Center(
//         child: LuluLoadingIndicator(
//           size: 36,
//         ),
//       );
//     } else if (threadResponseModel == null) {
//       // Show error or empty state if not loading but no data
//       return Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(localizations.noExpertFound),
//               const SizedBox(height: 20), // Add some spacing
//               ElevatedButton(
//                 onPressed: () {
//                   GoRouter.of(context).goNamed(route.chatRoomScreen);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Theme.of(context).primaryColor, // Text color
//                 ),
//                 child: Text(localizations.goToHomePage),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//     return Scaffold(
//       bottomNavigationBar:
//           _showChatTextField ? _chatTextField() : _noInternetConnectionText(),
//       appBar: _buildAppBar(theme),
//       body: CustomScrollView(
//         reverse: true,
//         slivers: [
//           PagedSliverList(
//             pagingController: _pagingController,
//             builderDelegate: PagedChildBuilderDelegate<BaseMessageModel>(
//               itemBuilder: (context, item, index) {
//                 if (index < combinedList.length) {
//                   final item = combinedList[index];
//                   return MessageBubble(
//                     message: item,
//                     userId: threadResponseModel.expert != null
//                         ? threadResponseModel.expert!.id
//                         : threadResponseModel.user!.id,
//                   );
//                 } else {
//                   if (index < combinedList.length) {
//                     final item = combinedList[index];
//                     return MessageBubble(
//                       message: item,
//                       userId: threadResponseModel.expert != null
//                           ? threadResponseModel.expert!.id
//                           : threadResponseModel.user!.id,
//                     );
//                   } else {
//                     return MessageBubble(
//                       message: item,
//                       userId: threadResponseModel.expert != null
//                           ? threadResponseModel.expert!.id
//                           : threadResponseModel.user!.id,
//                     );
//                   }
//                 }
//               },
//               firstPageProgressIndicatorBuilder: (_) =>
//                   const LuluLoadingIndicator(size: 60),
//               newPageProgressIndicatorBuilder: (_) => Padding(
//                 padding: EdgeInsets.only(top: 150.h, bottom: 48.h),
//                 child: const LuluLoadingIndicator(size: 30),
//               ),
//               noItemsFoundIndicatorBuilder: (_) {
//                 return _realTimeMessages.isEmpty
//                     ? const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [Text('Start a conversation')],
//                       )
//                     : Container(); // or some other widget if messages are present
//               },
//               noMoreItemsIndicatorBuilder: (_) => Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 5),
//                     child: FloatingActionButton(
//                       onPressed: _pagingController.refresh,
//                       backgroundColor: Colors.transparent,
//                       elevation: 0,
//                       child: const Icon(
//                         Icons.arrow_upward,
//                         color: LuluBrandColor.brandSecondary75,
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(bottom: 60),
//                     child: Text(
//                       'No more messages!!!',
//                       style: TextStyle(
//                         color: LuluBrandColor.brandSecondary75,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   PreferredSizeWidget _buildAppBar(ThemeData theme) {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(kToolbarHeight),
//       child: Container(
//         color: LuluBrandColor.brandPrimary,
//         padding: const EdgeInsets.only(
//           right: 16,
//           bottom: 8,
//         ),
//         child: AppBar(
//           backgroundColor: LuluBrandColor.brandPrimary,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios_sharp,
//               color: theme.highlightColor,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: Row(
//             children: [
//               const CircleAvatar(
//                 backgroundColor: LuluBrandColor.brandPrimary,
//                 radius: 24,
//                 backgroundImage: CachedNetworkImageProvider(
//                   'https://picsum.photos/250?image=10',
//                 ),
//               ),
//               const SizedBox(width: 18),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     threadResponseModel.expert != null
//                         ? threadResponseModel.expert!.fullName!
//                         : threadResponseModel.user!.fullName!,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: LuluBrandColor.brandWhite,
//                     ),
//                   ),
//                   const Text(
//                     'Online',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: LuluBrandColor.mainBackgroundColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           actions: const [
//             CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Icon(
//                 Icons.call,
//                 color: LuluBrandColor.brandBlack,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _noInternetConnectionText() {
//     return Container(
//       height: 40.h,
//       alignment: Alignment.topCenter,
//       color: LuluBrandColor.brandDarkGrey25,
//       padding: EdgeInsets.only(
//         left: 20.w,
//         right: 20.w,
//         top: 5.h,
//         bottom: 5.h,
//       ),
//       child: const Text(
//         'No internet connection',
//         style: TextStyle(
//           fontSize: 16,
//           color: LuluBrandColor.brandWhite,
//         ),
//       ),
//     );
//   }

//   Widget _chatTextField() {
//     final theme = Theme.of(context);
//     return Container(
//       color: theme.highlightColor,
//       padding: EdgeInsets.only(
//         left: 10,
//         right: 10,
//         top: 14,
//         bottom: MediaQuery.of(context).viewInsets.bottom + 30,
//       ),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 18),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           color: theme.highlightColor,
//         ),
//         child: Row(
//           children: [
//             Flexible(
//               child: TextField(
//                 controller: inputMessageController,
//                 maxLines: null,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: theme.highlightColor,
//                     ),
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(40),
//                     ),
//                   ),
//                   contentPadding: const EdgeInsets.only(
//                     left: 20,
//                     right: 20,
//                     top: 20,
//                     bottom: 10,
//                   ),
//                   hintText: 'Enter Your Message',
//                   hintStyle: const TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             CircleAvatar(
//               backgroundColor: LuluBrandColor.brandPrimary,
//               child: IconButton(
//                 onPressed: () {
//                   publishMessage(
//                     senderId,
//                     threadResponseModel.chatThreads.threadId,
//                     recievedId,
//                     0,
//                     0,
//                   );
//                   inputMessageController.clear();
//                 },
//                 icon: const Icon(
//                   Icons.send,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate({required this.child});
//   final Widget child;

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     final visibleExtent = maxExtent - shrinkOffset;
//     final topPadding = maxExtent - visibleExtent;

//     return Container(
//       height: visibleExtent,
//       padding: EdgeInsets.only(top: topPadding),
//       child: child,
//     );
//   }

//   @override
//   double get maxExtent => 120;

//   @override
//   double get minExtent => 120;

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }
