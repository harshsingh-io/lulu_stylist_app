import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/app/ai_chat_assistent/ai_chat_screen.dart';
import 'package:lulu_stylist_app/app/bottom_navigation/user_home_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/login_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/login_success.dart';
import 'package:lulu_stylist_app/app/login_and_signup/sign_up_screen.dart';
import 'package:lulu_stylist_app/app/onboarding/onboarding_screen.dart';
import 'package:lulu_stylist_app/app/settings/setting_screen.dart';
import 'package:lulu_stylist_app/app/update_profile/profile_update_success.dart';
import 'package:lulu_stylist_app/app/update_profile/update_profile_form.dart';
import 'package:lulu_stylist_app/app/user_profile/user_profile_screen.dart';
import 'package:lulu_stylist_app/app/view/app.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/add_item_wardrobe_screen.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_mangement_screen.dart';
export 'routes.dart';

// routes.dart
const String homeRoute = '/';
const String wardrobeManagementRoute = '/wardrobe-management';
const String addItemWardrobeRoute = '/addItemWardrobe';
const String aiChatRoute = '/ai-chat';
const String loginRoute = '/login';
const String signUpRoute = '/sign-up';
const String onboardingRoute = '/onboarding';
const String settingsRoute = '/settings';
const String userProfileRoute = '/user-profile';
const String loginOtpScreen = '/login-otp';
const String loginScreen = '/loginScreen';
const String updateUserProfile = '/updateUserProfile';
const String profileUpdateSuccess = '/profileUpdateSuccess';

Logger log = Logger(printer: PrettyPrinter());

final router = GoRouter(
  navigatorKey: App.globalNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: '/',
      path: homeRoute,
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      name: loginScreen,
      path: '/loginScreen/:isUser',
      builder: (context, state) {
        final isUser = state.pathParameters['isUser']! == 'true';

        return const LoginScreen(
          isUser: true,
        );
      },
    ),
    GoRoute(
      path: '/wardrobeScreen',
      name: wardrobeManagementRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const WardrobeScreen(),
    ),
    GoRoute(
      path: '/addItemWardrobe',
      name: addItemWardrobeRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const AddItemScreen(),
    ),
    GoRoute(
      path: '/aiChat',
      name: aiChatRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const AiChatScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      name: signUpRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const UserSignUpScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: onboardingRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const OnboardingScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: settingsRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const SettingScreen(),
    ),
    GoRoute(
      path: '/userProfile',
      name: userProfileRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const UserProfileScreen(),
    ),
    GoRoute(
      path: '/updateUserProfile',
      name: updateUserProfile,
      builder: (BuildContext context, GoRouterState state) =>
          const UserUpdateForm(),
    ),
    GoRoute(
      path: '/profileUpdateSuccess',
      name: profileUpdateSuccess,
      builder: (BuildContext context, GoRouterState state) =>
          const ProfileUdpateSuccess(),
    ),
  ],
);
