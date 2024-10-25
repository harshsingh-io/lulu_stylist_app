import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:lulu_stylist_app/app/login_and_signup/login_number_screen.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                // Lottie.asset(
                //   'assets/lottie/onboarding.json',
                //   width: 300,
                //   height: 300,
                //   fit: BoxFit.contain,
                // ),
                SvgPicture.asset(
                  'assets/logo/lulu.svg',
                  semanticsLabel: 'Lulu Logo',
                  // height: 90,
                  // width: 90,
                ),
                const SizedBox(height: 24),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // GoRouter.of(context).pushNamed(
                    //   loginScreen,
                    //   pathParameters: {
                    //     'isUser': 'true',
                    //   },
                    // );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => LoginScreen(
                                isUser: true,
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LuluBrandColor.brandPrimary,
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Let's get started",
                    style: TextStyle(color: LuluBrandColor.brandWhite),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'I already have an account',
                    style: TextStyle(
                      color: LuluBrandColor.brandPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
