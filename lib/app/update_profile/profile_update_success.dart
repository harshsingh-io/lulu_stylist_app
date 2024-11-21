import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

class ProfileUdpateSuccess extends StatefulWidget {
  const ProfileUdpateSuccess({Key? key}) : super(key: key);

  @override
  State<ProfileUdpateSuccess> createState() => _ProfileUdpateSuccessState();
}

class _ProfileUdpateSuccessState extends State<ProfileUdpateSuccess> {
  @override
  void initState() {
    super.initState();
    // Navigate to the home screen after a delay of 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacementNamed(homeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/lottie/profile_complete.json',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
