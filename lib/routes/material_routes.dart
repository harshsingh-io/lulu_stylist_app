import 'package:flutter/material.dart';
import 'package:lulu_stylist_app/app/ai_chat_assistent/ai_chat_screen.dart';
import 'package:lulu_stylist_app/app/bottom_navigation/user_home_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/login_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/sign_up_screen.dart';
import 'package:lulu_stylist_app/app/onboarding/onboarding_screen.dart';
import 'package:lulu_stylist_app/app/settings/setting_screen.dart';
import 'package:lulu_stylist_app/app/update_profile/profile_update_success.dart';
import 'package:lulu_stylist_app/app/update_profile/update_profile_form.dart';
import 'package:lulu_stylist_app/app/user_profile/user_profile_screen.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/add_item_wardrobe_screen.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_mangement_screen.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String updateProfile = '/update-profile';
  static const String profileUpdateSuccess = '/profile-update-success';
  static const String wardrobe = '/wardrobe';
  static const String addItem = '/add-item';
  static const String aiChat = '/ai-chat';
  static const String settings = '/settings';
  static const String userProfile = '/user-profile';
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case Routes.login:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(isUser: true),
      );
    case Routes.signUp:
      return MaterialPageRoute(builder: (_) => const UserSignUpScreen());
    case Routes.updateProfile:
      return MaterialPageRoute(builder: (_) => const UserUpdateForm());
    case Routes.profileUpdateSuccess:
      return MaterialPageRoute(builder: (_) => const ProfileUdpateSuccess());
    case Routes.wardrobe:
      return MaterialPageRoute(builder: (_) => const WardrobeScreen());
    case Routes.addItem:
      return MaterialPageRoute(builder: (_) => const AddItemScreen());
    case Routes.aiChat:
      return MaterialPageRoute(builder: (_) => const AiChatScreen());
    case Routes.settings:
      return MaterialPageRoute(builder: (_) => const SettingScreen());
    case Routes.userProfile:
      return MaterialPageRoute(builder: (_) => const UserProfileScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
