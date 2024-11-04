import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:lulu_stylist_app/app/login_and_signup/login_screen.dart';
import 'package:lulu_stylist_app/app/login_and_signup/sign_up_screen.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/lulu_design_system/toast/sa_toast.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({required this.error, super.key});
  String error;
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    if (widget.error.isNotEmpty) {
      LuluToast.showToast(
        title: 'Oh! Error occured',
        message: 'It seems like an error occured while Login/SignUp',
        contentType: ContentType.failure,
      );
    }
    // TODO: implement initState
    super.initState();
  }

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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => UserSignUpScreen(
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => LoginScreen(
                                isUser: true,
                              )),
                    );
                  },
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
