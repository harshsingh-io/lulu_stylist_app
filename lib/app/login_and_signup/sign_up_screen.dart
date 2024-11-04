// lib/screens/user_signup_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_event.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_state.dart';
import 'package:lulu_stylist_app/lulu_design_system/lulu_design_system.dart';

import 'login_success.dart';
import 'login_screen.dart';

class UserSignUpScreen extends StatefulWidget {
  final bool isUser;
  final String? error;

  const UserSignUpScreen({Key? key, required this.isUser, this.error})
      : super(key: key);

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUpButtonPressed() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    // Basic Validation
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Fluttertoast.showToast(
        msg: "All fields are required.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: LuluBrandColor.brandRed,
        textColor: Colors.white,
      );
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      Fluttertoast.showToast(
        msg: "Please enter a valid email address.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: LuluBrandColor.brandRed,
        textColor: Colors.white,
      );
      return;
    }

    if (password.length < 6) {
      Fluttertoast.showToast(
        msg: "Password must be at least 6 characters long.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: LuluBrandColor.brandRed,
        textColor: Colors.white,
      );
      return;
    }

    if (password != confirmPassword) {
      Fluttertoast.showToast(
        msg: "Passwords do not match.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: LuluBrandColor.brandRed,
        textColor: Colors.white,
      );
      return;
    }

    // Dispatch the Registered event to AuthenticationBloc
    BlocProvider.of<AuthenticationBloc>(context).add(
      Registered(email: email, password: password),
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
              msg: "Signup Successful!",
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
                  SizedBox(height: 80.h),
                  Lottie.asset(
                    'assets/lottie/login_lottie.json', // Ensure you have this asset
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
                      "Create Your Account",
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

                  SizedBox(height: LuluSpacing.sm.h),

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

                  SizedBox(height: LuluSpacing.sm.h),

                  // Confirm Password TextFormField
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
                      controller: confirmPasswordController,
                      obscureText:
                          !_isConfirmPasswordVisible, // This controls the visibility
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            // Toggling the state to show/hide password
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: LuluSpacing.xl),

                  // Sign Up Button with BLoC State Handling
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return LuluButton.primary(
                        label: state is Authenticating
                            ? 'Signing Up...'
                            : 'Sign Up',
                        onPressed: state is Authenticating
                            ? null
                            : _onSignUpButtonPressed,
                      );
                    },
                  ),

                  const SizedBox(height: LuluSpacing.md),

                  // Navigate to Login Screen
                  TextButton(
                    onPressed: () {
                      // Navigate back to LoginScreen
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Already have an account? Login",
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
