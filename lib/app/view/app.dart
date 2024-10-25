import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lulu_stylist_app/l10n/l10n.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/login/login_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/mqtt/mqtt_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/networks/network_bloc.dart';
import 'package:lulu_stylist_app/lulu_design_system/widgets/sa_app_bar_theme.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

const double designSizeWidth = 390;
const double designSizeHeight = 844;

class App extends StatefulWidget {
  const App({super.key});

  static final GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static _AppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_AppState>();
  }

  static void setLocale(BuildContext context, Locale newLocale) {
    of(context)?.setLocale(newLocale);
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale? _appLocale;

  void setLocale(Locale locale) {
    setState(() {
      _appLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(
          designSizeWidth,
          designSizeHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (
          _,
          child,
        ) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthenticationBloc>(
                create: (context) => AuthenticationBloc()
                  ..add(AuthenticationEvent.checkExisting()),
              ),
              BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(),
              ),
              BlocProvider<MqttBloc>(
                create: (context) => MqttBloc(),
                lazy: false,
              ),
              BlocProvider<NetworkBloc>(
                create: (context) =>
                    NetworkBloc()..add(NetworkEvent.observer()),
              ),
            ],
            child: BlocListener<NetworkBloc, NetworkState>(
              listener: (context, state) {
                state.maybeWhen(
                  failure: () {
                    // Show a failure message when network is unavailable
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No internet connection')),
                    );
                  },
                  success: () {
                    // Show a success message when network is available
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Connected to internet')),
                    );
                  },
                  orElse: () {},
                );
              },
              child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  state.maybeWhen(
                    initial: () {
                      // Optionally show a splash screen
                    },
                    checking: () {
                      // Optionally show a loading indicator
                    },
                    unAuthenticated: () {
                      // Navigate to the onboarding screen
                      GoRouter.of(
                        App.globalNavigatorKey.currentContext!,
                      ).pushReplacementNamed(onboardingRoute);
                    },
                    userNeedsProfileDetails: (userModel, authToken) {
                      // Navigate to the profile update screen
                      GoRouter.of(
                        App.globalNavigatorKey.currentContext!,
                      ).pushReplacementNamed('profile_update',
                          extra: userModel);
                    },
                    userLoggedIn: (user, authToken) {
                      // Navigate to the home screen
                      GoRouter.of(
                        App.globalNavigatorKey.currentContext!,
                      ).pushReplacementNamed(homeRoute, extra: user);
                    },
                    userAuthenticated: (user, authToken) {
                      // User is authenticated but not logged in yet (if applicable)
                      // For simplicity, navigate to home
                      GoRouter.of(
                        App.globalNavigatorKey.currentContext!,
                      ).pushReplacementNamed(homeRoute, extra: user);
                    },
                    loggedOut: () {
                      // Navigate back to the onboarding screen
                      GoRouter.of(
                        App.globalNavigatorKey.currentContext!,
                      ).pushReplacementNamed(onboardingRoute);
                    },
                    orElse: () {
                      GoRouter.of(
                        App.globalNavigatorKey.currentContext!,
                      ).pushReplacementNamed(onboardingRoute);
                    },
                  );
                },
                builder: (context, state) {
                  return MaterialApp.router(
                    routerConfig: router,
                    scaffoldMessengerKey: App.scaffoldMessengerKey,
                    supportedLocales: const [
                      Locale('en'),
                      Locale('hi'),
                    ],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      for (final supportedLocale in supportedLocales) {
                        if (locale != null &&
                            supportedLocale.languageCode ==
                                locale.languageCode) {
                          return supportedLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                    locale: _appLocale,
                    title: 'Lulu',
                    theme: ThemeData(
                      useMaterial3: true,
                      appBarTheme: LuluAppBarTheme.appBarLightThemeData,
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
