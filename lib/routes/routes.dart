import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/app/ai_chat_assistent/ai_chat_screen.dart';
import 'package:lulu_stylist_app/app/bottom_navigation/user_home_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/login_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/sign_up_screen.dart';
import 'package:lulu_stylist_app/app/onboarding/onboarding_screen.dart';
import 'package:lulu_stylist_app/app/settings/setting_screen.dart';
import 'package:lulu_stylist_app/app/update_profile/profile_update_success.dart';
import 'package:lulu_stylist_app/app/update_profile/update_profile_form.dart';
import 'package:lulu_stylist_app/app/user_profile/user_profile_screen.dart';
import 'package:lulu_stylist_app/app/view/app.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/add_item_wardrobe_screen.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_mangement_screen.dart';

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

final GoRouter router = GoRouter(
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

        return LoginScreen(
          isUser: true,
        );
      },
    ),
    GoRoute(
      name: '/wardrobeScreen',
      path: wardrobeManagementRoute,
      builder: (BuildContext context, GoRouterState state) => WardrobeScreen(),
    ),
    GoRoute(
      name: '/addItemWardrobe',
      path: addItemWardrobeRoute,
      builder: (BuildContext context, GoRouterState state) => AddItemScreen(),
    ),
    GoRoute(
      name: '/aiChat',
      path: aiChatRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const AiChatScreen(),
    ),
    GoRoute(
      name: '/signUp',
      path: signUpRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const UserSignUpScreen(),
    ),
    GoRoute(
      name: '/onboarding',
      path: onboardingRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const OnboardingScreen(),
    ),
    GoRoute(
      name: '/settings',
      path: settingsRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const SettingScreen(),
    ),
    GoRoute(
      name: '/userProfile',
      path: userProfileRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const UserProfileScreen(),
    ),
    GoRoute(
      name: '/updateUserProfile',
      path: updateUserProfile,
      builder: (BuildContext context, GoRouterState state) => UserUpdateForm(),
    ),
    GoRoute(
      name: '/profileUpdateSuccess',
      path: profileUpdateSuccess,
      builder: (BuildContext context, GoRouterState state) =>
          ProfileUdpateSuccess(),
    ),
  ],
);
