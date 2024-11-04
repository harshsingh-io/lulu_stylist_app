import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:lulu_stylist_app/app/bottom_navigation/user_home_screen.dart';
import 'package:lulu_stylist_app/app/onboarding/onboarding_screen.dart';
import 'package:lulu_stylist_app/l10n/l10n.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/local/item.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/auth_repository.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_event.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_state.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/login/login_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/mqtt/mqtt_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/networks/network_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/repository/wardrobe_repository.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/repository/wardrobe_repository_impl.dart';
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
  void initState() {
    super.initState();
    // Initialize Firebase here if not done elsewhere
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await Firebase.initializeApp();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize Firebase
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error initializing Firebase'),
              ),
            ),
          );
        }

        // Once complete, show the application
        if (snapshot.connectionState == ConnectionState.done) {
          return RepositoryProvider(
            // Provide the AuthenticationRepository to the widget tree
            create: (context) => AuthenticationRepository(),
            child: MultiRepositoryProvider(
              providers: [
                RepositoryProvider<WardrobeRepository>(
                  create: (context) => WardrobeRepositoryImpl(
                    FirebaseFirestore.instance,
                    Hive.box<Item>('items'),
                  ),
                ),
                // Add other repositories here
              ],
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<AuthenticationBloc>(
                    create: (context) => AuthenticationBloc(
                      authRepository:
                          RepositoryProvider.of<AuthenticationRepository>(
                              context),
                    )..add(AppStarted()),
                  ),
                  BlocProvider<LoginBloc>(
                    create: (context) => LoginBloc(
                      authenticationRepository:
                          RepositoryProvider.of<AuthenticationRepository>(
                              context),
                    ),
                  ),
                  BlocProvider<WardrobeBloc>(
                    create: (context) => WardrobeBloc(
                      RepositoryProvider.of<WardrobeRepository>(context),
                    ),
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
                        App.scaffoldMessengerKey.currentState?.showSnackBar(
                          SnackBar(content: Text('No internet connection')),
                        );
                      },
                      success: () {
                        // Show a success message when network is available
                        App.scaffoldMessengerKey.currentState?.showSnackBar(
                          SnackBar(content: Text('Connected to internet')),
                        );
                      },
                      orElse: () {},
                    );
                  },
                  child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return ScreenUtilInit(
                        designSize: const Size(
                          375, // Replace with your design size width
                          812, // Replace with your design size height
                        ),
                        minTextAdapt: true,
                        splitScreenMode: true,
                        builder: (
                          context,
                          child,
                        ) {
                          return MaterialApp(
                            navigatorKey: App.globalNavigatorKey,
                            scaffoldMessengerKey: App.scaffoldMessengerKey,
                            supportedLocales: const [
                              Locale('en'),
                              Locale('hi'),
                            ],
                            localizationsDelegates: const [
                              AppLocalizations.delegate,
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                            ],
                            localeResolutionCallback: (Locale? locale,
                                Iterable<Locale> supportedLocales) {
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
                            // Define routes or use routerConfig if using GoRouter or similar
                            home: _buildHome(state),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        }

        // Otherwise, show a loading spinner
        return MaterialApp(
          home: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget _buildHome(AuthenticationState state) {
    if (state is Authenticated) {
      return HomePage();
    } else if (state is Unauthenticated) {
      return OnboardingScreen(
        error: '',
      );
    } else if (state is Authenticating) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else if (state is AuthenticationFailure) {
      return OnboardingScreen(error: state.message);
    }
    // Default fallback
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
