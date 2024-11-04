// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:lulu_stylist_app/app/login_and_signup/login_success.dart';
import 'package:lulu_stylist_app/app/login_and_signup/sign_up_screen.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_event.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_state.dart';
import 'package:lulu_stylist_app/lulu_design_system/lulu_design_system.dart';

class LoginScreen extends StatefulWidget {
  final bool isUser;
  final String? error;

  const LoginScreen({Key? key, required this.isUser, this.error})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    // If there's an initial error, show a toast
    if (widget.error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Fluttertoast.showToast(
          msg: widget.error!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: LuluBrandColor.brandRed,
          textColor: Colors.white,
        );
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLoginButtonPressed() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Dispatch the LoggedIn event to AuthenticationBloc
    BlocProvider.of<AuthenticationBloc>(context).add(
      LoggedIn(email: email, password: password),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationFailure) {
            Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: LuluBrandColor.brandRed,
              textColor: Colors.white,
            );
          } else if (state is Authenticated) {
            Fluttertoast.showToast(
              msg: "Login Successful!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
            // Navigate to HomeScreen or show splash screen
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginSuccessSplashScreen(),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: LuluSpacing.md.w,
              vertical: LuluSpacing.lg.h,
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
                      "Welcome Back!\nLogin to continue",
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: LuluSpacing.sm.h),

                  // Email TextFormField
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 1),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  // Divider Line
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 1.5,
                      width: double.infinity,
                      color: Colors.transparent,
                    ),
                  ),
                  // Password TextFormField
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 1),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText:
                          !_isPasswordVisible, // This controls the visibility
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_outline),
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

                  // Login Button with BLoC State Handling
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return LuluButton.primary(
                        label:
                            state is Authenticating ? 'Logging In...' : 'Login',
                        onPressed: state is Authenticating
                            ? null
                            : _onLoginButtonPressed,
                      );
                    },
                  ),
                  const SizedBox(height: LuluSpacing.md),
                  TextButton(
                    onPressed: () {
                      // Navigate to SignupScreen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UserSignUpScreen(
                            isUser: true,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(color: LuluBrandColor.brandBlue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
