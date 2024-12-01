import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/lulu_design_system/lulu_design_system.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({required this.isUser, super.key});

  final bool isUser;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.maybeWhen(
          checking: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          userLoggedIn: (user, authToken) {
            Navigator.of(context).pop();
            context.pushNamed(homeRoute);
          },
          userNeedsProfileDetails: (user, authToken) {
            Navigator.of(context).pop();
            context.pushNamed(updateUserProfile);
          },
          error: (message) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: LuluSpacing.md.w),
            child: Form(
              key: _formKey,
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
                      'Welcome Back!',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Email Field
                  _buildTextField(
                    controller: emailController,
                    hintText: 'Email Address',
                    prefixIcon: Icons.email_outlined,
                    validator: _validateEmail,
                  ),
                  SizedBox(height: LuluSpacing.md.h),
                  // Password Field
                  _buildTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                    isPasswordVisible: _isPasswordVisible,
                    onVisibilityToggle: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    validator: _validatePassword,
                  ),
                  SizedBox(height: LuluSpacing.xl.h),
                  // Login Button
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        checking: () => const CircularProgressIndicator(),
                        orElse: () => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: LuluSpacing.lg.w,
                          ),
                          child: LuluButton.primary(
                            label: 'Login',
                            onPressed: _handleLogin,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: LuluSpacing.md.h),
                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: theme.textTheme.bodyLarge,
                      ),
                      GestureDetector(
                        onTap: () => context.pushNamed(signUpRoute),
                        child: Text(
                          'Sign Up',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: LuluBrandColor.brandPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
    bool? isPasswordVisible,
    VoidCallback? onVisibilityToggle,
    String? Function(String?)? validator,
  }) {
    return Container(
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
        controller: controller,
        obscureText: isPassword && !(isPasswordVisible ?? false),
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          border: InputBorder.none,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible ?? false
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: onVisibilityToggle,
                )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 16,
          ),
          errorStyle: const TextStyle(
            color: LuluBrandColor.brandRed,
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthenticationBloc>().add(
            AuthenticationEvent.login(
              email: emailController.text.trim(),
              password: passwordController.text,
            ),
          );
    }
  }
}
