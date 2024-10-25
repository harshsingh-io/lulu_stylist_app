import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/app/ai_chat_assistent/ai_chat_screen.dart';
import 'package:lulu_stylist_app/app/bottom_navigation/user_home_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/home/login_number_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/home/login_otp_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/login_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/sign_up_screen.dart';
import 'package:lulu_stylist_app/app/onboarding/onboarding_screen.dart';
import 'package:lulu_stylist_app/app/settings/setting_screen.dart';
import 'package:lulu_stylist_app/app/user_profile/user_profile_screen.dart';
import 'package:lulu_stylist_app/app/view/app.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/add_item_wardrobe_screen.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_mangement_screen.dart';

// routes.dart
const String homeRoute = '/';
const String wardrobeManagementRoute = '/wardrobe-management';
const String addItemWardrobeRoute = '/add-item-wardrobe';
const String aiChatRoute = '/ai-chat';
const String loginRoute = '/login';
const String signUpRoute = '/sign-up';
const String onboardingRoute = '/onboarding';
const String settingsRoute = '/settings';
const String userProfileRoute = '/user-profile';
const String loginOtpScreen = '/login-otp';
const String loginScreen = '/loginScreen';

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
      name: '/loginOtpScreen',
      path: loginOtpScreen,
      builder: (context, state) {
        final isUser = state.pathParameters['isUser'] == 'true';
        final phoneNumber = state.pathParameters['phoneNumber'];

        if (phoneNumber == null || phoneNumber.isEmpty) {
          throw Exception('PhoneNumber is required for this route');
        }

        // Pass the parameters to the ExpertOtp screen
        return LoginOtpScreen(
          isUser: isUser,
          phoneNumber: phoneNumber,
        );
      },
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
      name: '/login',
      path: loginRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const UserLoginScreen(),
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
      name: profileCompletionRoute,
      path: '/profile-completion',
      builder: (context, state) => ProfileCompletionScreen(),
    ),
    GoRoute(
      name: '/userProfile',
      path: userProfileRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const UserProfileScreen(),
    ),
  ],
);
