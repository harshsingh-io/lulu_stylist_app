import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/app/ai_chat_assistent/ai_chat_screen.dart';
import 'package:lulu_stylist_app/app/user_profile/user_profile_screen.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_mangement_screen.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/chat/bloc/chat_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/chat/chat_repository.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/wardrobe_repository.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_spacing.dart';
import 'package:lulu_stylist_app/notification/notification_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:lulu_stylist_app/utils/injection.dart';

Logger log = Logger(printer: PrettyPrinter());

class HomePage extends StatefulWidget with SU {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      // NotificationUtils.requireUserNotificationPermissions(context);
    });

    // Wrap the entire content with MultiBlocProvider
    return MultiBlocProvider(
      providers: [
        BlocProvider<WardrobeBloc>(
          create: (context) => WardrobeBloc(
            repository: getIt<WardrobeRepository>(),
            authBloc: context.read<AuthenticationBloc>(),
          ),
        ),

        // Add other blocs here if needed
      ],
      child: !kIsWeb && Platform.isIOS
          ? CupertinoApp(
              theme: const CupertinoThemeData(brightness: Brightness.light),
              home: _buildCupertino(context),
            )
          : _buildMaterial(context),
    );
  }

  Widget _buildCupertino(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.personEnteringBooth),
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.video),
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.comments),
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.userCircle),
          ),
        ],
        activeColor: LuluBrandColor.brandPrimary,
        inactiveColor: LuluBrandColor.brandGrey300,
        iconSize: LuluSpacing.lg,
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) => _getTabPage(index),
        );
      },
    );
  }

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildMaterial(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _buildCustomBottomNavBar(localizations),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: kBottomNavigationBarHeight + LuluSpacing.md.h,
        ),
        child: IndexedStack(
          index: _currentIndex,
          children: [
            BlocProvider<ChatBloc>(
              create: (context) => ChatBloc(
                chatRepository: getIt<ChatRepository>(),
                authBloc: context.read<AuthenticationBloc>(),
              )..add(const ChatEvent.started()),
              child: const AiChatScreen(),
            ),
            const WardrobeScreen(),
            const UserProfileScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomBottomNavBar(AppLocalizations localizations) {
    return BottomAppBar(
      height: 65.h,
      color: LuluBrandColor.brandPrimary, // Dark teal background color
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // _buildNavItem(
          //   icon: 'assets/bottom_bar_icons/home_4_line.svg',
          //   activeIcon: 'assets/bottom_bar_icons/home_4_fill.svg',
          //   label: localizations.home,
          //   index: 0,
          // ),
          _buildNavItem(
            icon: 'assets/bottom_bar_icons/chat_icon.svg',
            activeIcon: 'assets/bottom_bar_icons/chat_icon_filled.svg',
            label: localizations.chat,
            index: 0,
          ),
          _buildNavItem(
            icon: 'assets/bottom_bar_icons/hanger_icon.svg',
            activeIcon: 'assets/bottom_bar_icons/hanger_icon_filled.svg',
            label: localizations.wardrobe,
            index: 1,
          ),
          _buildNavItem(
            icon: 'assets/bottom_bar_icons/user_star_line.svg',
            activeIcon: 'assets/bottom_bar_icons/user_star_fill.svg',
            label: localizations.profile,
            index: 2,
          ),
        ]
            .map((widget) => Expanded(child: widget))
            .toList(), // Equal space for each item
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String activeIcon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => _onBottomNavBarTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            height: 20.h,
            width: 20.w,
            _currentIndex == index ? activeIcon : icon,
            color: LuluBrandColor
                .brandAccentSoftIvory, // White icons for both active and inactive states
          ),
          Text(
            label,
            style: const TextStyle(
              color: LuluBrandColor
                  .brandAccentSoftIvory, // White text color for both active and inactive states
            ),
          ),
          if (_currentIndex == index)
            Container(
              margin: EdgeInsets.only(top: 2.h),
              height: 1.h,
              width: 40.w,
              color: LuluBrandColor
                  .brandAccentSoftIvory, // White underline for the active tab
            ),
        ],
      ),
    );
  }

  Widget _getTabPage(int index) {
    switch (index) {
      // case 0:
      //   return const Scaffold();
      case 0:
        return BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(
            chatRepository: getIt<ChatRepository>(),
            authBloc: context.read<AuthenticationBloc>(),
          )..add(const ChatEvent.started()), // Initialize the bloc when created
          child: const AiChatScreen(),
        );
      case 1:
        return const WardrobeScreen();
      case 2:
        return const UserProfileScreen();
      default:
        return const Placeholder();
    }
  }
}
