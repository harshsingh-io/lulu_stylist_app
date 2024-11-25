import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:lulu_stylist_app/app/login_and_signup/login_success.dart';
import 'package:lulu_stylist_app/lulu_design_system/lulu_design_system.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

Logger log = Logger(printer: PrettyPrinter());

class LoginScreen extends StatefulWidget with SU {
  const LoginScreen({required this.isUser, super.key});

  final bool isUser;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: LuluSpacing.md.w,
            right: LuluSpacing.md.w,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 120.h),
                Lottie.asset(
                  'assets/lottie/login_lottie.json',
                  width: 300.h,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: LuluSpacing.lg.w,
                    vertical: LuluSpacing.xl.h,
                  ),
                  child: Text(
                    'Welcome! \n Register to get started',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: LuluSpacing.sm.h),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: 'Email Address',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                // Divider Line
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 1.5,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText:
                        !_isPasswordVisible, // This controls the visibility
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          // Toggling the state to show/hide password
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: LuluSpacing.xl),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: LuluSpacing.lg.w),
                  child: LuluButton.primary(
                    label: 'Register',
                    onPressed: _handleSignIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Email and password cannot be empty',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: LuluBrandColor.brandRed,
        textColor: Colors.white,
      );
      return;
    }

    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Show the splash screen after login success
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginSuccessSplashScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      log.e('Login failed with error ${e.message}');
      Fluttertoast.showToast(
        msg: e.message ?? 'Login failed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: LuluBrandColor.brandRed,
        textColor: Colors.white,
      );
    }
  }
}
