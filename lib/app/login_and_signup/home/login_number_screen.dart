import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/lulu_design_system/lulu_design_system.dart';

Logger log = Logger(printer: PrettyPrinter());

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.isUser});

  final bool isUser;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: LuluBrandColor.brandWhite,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 420.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: LuluSpacing.lg.w),
                child: Text(
                  "Welcome! Register to get started",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: LuluSpacing.sm.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: LuluSpacing.lg.w),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              SizedBox(height: LuluSpacing.xxs.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: LuluSpacing.lg.w),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: LuluSpacing.xl),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: LuluSpacing.lg.w),
                child: LuluButton.primary(
                  label: 'Login / Register',
                  onPressed: _handleSignIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Email and password cannot be empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: LuluBrandColor.brandRed,
        textColor: Colors.white,
      );
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (widget.isUser) {
        GoRouter.of(context).push('/home');
      } else {
        GoRouter.of(context).push('/registration');
      }
    } on FirebaseAuthException catch (e) {
      log.e('Login failed with error ${e.message}');
      Fluttertoast.showToast(
        msg: e.message ?? "Login failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: LuluBrandColor.brandRed,
        textColor: Colors.white,
      );
    }
  }
}
