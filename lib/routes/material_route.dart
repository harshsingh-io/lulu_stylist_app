// import 'package:flutter/material.dart';
// import 'package:lulu_stylist_app/app/ai_chat_assistent/ai_chat_screen.dart';
// import 'package:lulu_stylist_app/app/bottom_navigation/user_home_screen.dart';
// import 'package:lulu_stylist_app/app/login_and_signup/home/login_otp_screen.dart';
// import 'package:lulu_stylist_app/app/login_and_signup/login_screen.dart';
// import 'package:lulu_stylist_app/app/login_and_signup/sign_up_screen.dart';
// import 'package:lulu_stylist_app/app/onboarding/onboarding_screen.dart';
// import 'package:lulu_stylist_app/app/settings/setting_screen.dart';
// import 'package:lulu_stylist_app/app/user_profile/user_profile_screen.dart';
// import 'package:lulu_stylist_app/app/wardrobe_management/add_item_wardrobe_screen.dart';
// import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_mangement_screen.dart';

// // routes.dart
// const String homeRoute = '/';
// const String wardrobeManagementRoute = '/wardrobe-management';
// const String addItemWardrobeRoute = '/add-item-wardrobe';
// const String aiChatRoute = '/ai-chat';
// const String loginRoute = '/login';
// const String signUpRoute = '/sign-up';
// const String onboardingRoute = '/onboarding';
// const String settingsRoute = '/settings';
// const String userProfileRoute = '/user-profile';
// const String loginOtpRoute = '/login-otp';

// Route<dynamic>? generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case homeRoute:
//       return MaterialPageRoute(builder: (_) => const HomePage());
//     case loginRoute:
//       return MaterialPageRoute(builder: (_) => const UserLoginScreen());
//     case signUpRoute:
//       return MaterialPageRoute(builder: (_) => const UserSignUpScreen());
//     case onboardingRoute:
//       return MaterialPageRoute(builder: (_) => const OnboardingScreen());
//     case settingsRoute:
//       return MaterialPageRoute(builder: (_) => const SettingScreen());
//     case userProfileRoute:
//       return MaterialPageRoute(builder: (_) => const UserProfileScreen());
//     case wardrobeManagementRoute:
//       return MaterialPageRoute(builder: (_) => WardrobeScreen());
//     case addItemWardrobeRoute:
//       return MaterialPageRoute(builder: (_) => AddItemScreen());
//     case aiChatRoute:
//       return MaterialPageRoute(builder: (_) => const AiChatScreen());
//     case loginOtpRoute:
//       final args = settings.arguments as Map<String, dynamic>? ?? {};
//       return MaterialPageRoute(
//           builder: (_) => LoginOtpScreen(
//               isUser: args['isUser'] as bool,
//               phoneNumber: args['phoneNumber'] as String));
//     default:
//       return MaterialPageRoute(builder: (_) {
//         return Scaffold(
//           body: Center(
//             child: Text('No route defined for ${settings.name}'),
//           ),
//         );
//       });
//   }
// }
