import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_item_detail_screen.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_mangement_screen.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart'
    as wardrobe_model;
import 'package:lulu_stylist_app/logic/api_base.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/user/bloc/user_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/user/user_repository.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/wardrobe_repository.dart';
import 'package:lulu_stylist_app/utils/injection.dart';

export 'routes.dart';

// routes.dart
const String homeRoute = '/';
const String wardrobeManagementRoute = '/wardrobe-management';
const String addItemWardrobeRoute = '/addItemWardrobe';
const String aiChatRoute = '/ai-chat';
const String loginRoute = '/login';
const String signUpRoute = '/sign-up';
const String onboardingRoute = '/onboarding';
const String wardrobeItemDetailRoute = '/wardrobe-item-detail';
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
      name: addItemWardrobeRoute,
      path: '/addItemWardrobe',
      builder: (context, state) {
        // Create a new instance or get existing WardrobeBloc
        final authBloc = context.read<AuthenticationBloc>();
        final wardrobeBloc = WardrobeBloc(
          repository: getIt<WardrobeRepository>(),
          authBloc: authBloc,
        );

        return BlocProvider(
          create: (context) => wardrobeBloc,
          child: const AddItemScreen(),
        );
      },
    ),
    GoRoute(
      name: wardrobeItemDetailRoute,
      path: '/wardrobe-item-detail',
      builder: (BuildContext context, GoRouterState state) {
        final item = state.extra as wardrobe_model.WardrobeItem;
        return BlocProvider(
          create: (context) => WardrobeBloc(
            repository: getIt<WardrobeRepository>(),
            authBloc: context.read<AuthenticationBloc>(),
          ),
          child: WardrobeItemDetailScreen(item: item),
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
      builder: (BuildContext context, GoRouterState state) {
        // Get the token from navigation state if it was passed
        final user = state.extra as UserModel?;
        final token = state.extra as String?;

        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: context.read<AuthenticationBloc>(),
            ),
            BlocProvider(
              create: (context) => UserBloc(
                userRepository: UserRepository(baseUrl: apiBase),
                authBloc: context.read<AuthenticationBloc>(),
              ),
            ),
          ],
          child: const UserUpdateForm(),
        );
      },
    ),
    GoRoute(
      path: '/profileUpdateSuccess',
      name: profileUpdateSuccess,
      builder: (BuildContext context, GoRouterState state) =>
          const ProfileUdpateSuccess(),
    ),
  ],
);
