import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lulu_stylist_app/l10n/l10n.dart';
import 'package:lulu_stylist_app/logic/api_base.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/auth_repository.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/login/login_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/mqtt/mqtt_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/networks/network_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/user/bloc/user_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/user/user_repository.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/wardrobe_repository.dart';
import 'package:lulu_stylist_app/lulu_design_system/widgets/sa_app_bar_theme.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

const double designSizeWidth = 390;
const double designSizeHeight = 844;

class App extends StatefulWidget {
  const App({super.key});

  static final GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> notificationNavigatorKey =
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

class _AppState extends State<App> with WidgetsBindingObserver {
  Locale? _appLocale;
  late final AuthRepository _authRepository;
  late final AuthenticationBloc _authBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _authRepository = AuthRepository(baseUrl: apiBase);
    _authBloc = AuthenticationBloc()
      ..add(const AuthenticationEvent.checkExisting());

    // Listen for session expiry
    _authRepository.sessionExpired.listen((_) {
      _authBloc.add(const AuthenticationEvent.sessionExpired());
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _authBloc.close();
    super.dispose();
  }

  void setLocale(Locale locale) {
    setState(() {
      _appLocale = locale;
    });
  }

  void _showErrorSnackBar(String message) {
    App.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(designSizeWidth, designSizeHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (context) => _authBloc,
            ),
            BlocProvider<AuthenticationBloc>.value(value: _authBloc),
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(_authRepository),
            ),
            BlocProvider<UserBloc>(
              create: (context) => UserBloc(
                userRepository: UserRepository(baseUrl: apiBase),
                authBloc: context.read<AuthenticationBloc>(),
              ),
            ),
            BlocProvider<NetworkBloc>(
              create: (context) =>
                  NetworkBloc()..add(const NetworkEvent.observer()),
            ),
          ],
          child: MultiBlocListener(
            listeners: [
              BlocListener<NetworkBloc, NetworkState>(
                listener: (context, state) {
                  state.maybeWhen(
                    failure: () {
                      App.scaffoldMessengerKey.currentState?.showSnackBar(
                        const SnackBar(content: Text('No internet connection')),
                      );
                    },
                    success: () {
                      App.scaffoldMessengerKey.currentState?.showSnackBar(
                        const SnackBar(content: Text('Connected to internet')),
                      );
                    },
                    orElse: () {},
                  );
                },
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.maybeWhen(
                    loginUserSuccess:
                        (authToken, refreshToken, user, userType) {
                      _authBloc.add(
                        AuthenticationEvent.newUserLogin(
                          authToken: authToken,
                          user: user,
                        ),
                      );
                    },
                    error: (message) {
                      _showErrorSnackBar(message);
                    },
                    orElse: () {},
                  );
                },
              ),
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  state.maybeWhen(
                    initial: () {
                      // Handle initial state if needed
                    },
                    checking: () {
                      // Show loading indicator if needed
                    },
                    unAuthenticated: () {
                      GoRouter.of(App.globalNavigatorKey.currentContext!)
                          .pushReplacementNamed(onboardingRoute);
                    },
                    userNeedsProfileDetails: (user, authToken) {
                      GoRouter.of(App.globalNavigatorKey.currentContext!)
                          .pushReplacementNamed('profile_update', extra: user);
                    },
                    userLoggedIn: (user, authToken) {
                      GoRouter.of(App.globalNavigatorKey.currentContext!)
                          .pushReplacementNamed(homeRoute, extra: user);
                    },
                    userAuthenticated: (user, authToken) {
                      GoRouter.of(App.globalNavigatorKey.currentContext!)
                          .pushReplacementNamed(homeRoute, extra: user);
                    },
                    loggedOut: () {
                      GoRouter.of(App.globalNavigatorKey.currentContext!)
                          .pushReplacementNamed(onboardingRoute);
                    },
                    error: (message) {
                      _showErrorSnackBar(message);
                    },
                    orElse: () {},
                  );
                },
              ),
            ],
            child: MaterialApp.router(
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
                      supportedLocale.languageCode == locale.languageCode) {
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
            ),
          ),
        );
      },
    );
  }
}
