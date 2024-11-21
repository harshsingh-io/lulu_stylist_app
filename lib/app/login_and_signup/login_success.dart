import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

class LoginSuccessSplashScreen extends StatefulWidget {
  const LoginSuccessSplashScreen({Key? key}) : super(key: key);

  @override
  State<LoginSuccessSplashScreen> createState() =>
      _LoginSuccessSplashScreenState();
}

class _LoginSuccessSplashScreenState extends State<LoginSuccessSplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after a delay of 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacementNamed(updateUserProfile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/lottie/login_success.json',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
