import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/login/login_bloc.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:pin_code_fields/pin_code_fields.dart' as pinCodeFields;
import 'package:lulu_stylist_app/logic/api/users/models/user_type.dart';

class LoginOtpScreen extends StatefulWidget {
  LoginOtpScreen({
    super.key,
    required this.phoneNumber,
    required this.isUser,
  });
  final String phoneNumber;
  bool isUser;

  @override
  State<LoginOtpScreen> createState() => _LoginOtpScreenState();
}

class _LoginOtpScreenState extends State<LoginOtpScreen> {
  final TextEditingController pinEditingController = TextEditingController();
  bool isButtonEnabled = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final localizations = AppLocalizations.of(
      context,
    )!;
    final isKeyboardOpen = MediaQuery.of(
          context,
        ).viewInsets.bottom !=
        0;
    final theme = Theme.of(
      context,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            state.maybeWhen(
              error: (err) {
                isLoading = false;
                Future.delayed(Duration.zero, () {
                  final snackBar = SnackBar(
                    content: Text(
                      err,
                    ),
                  );
                  Fluttertoast.showToast(
                    msg: localizations.somethingWentWrongOTP,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                  if (err == 'Otp mismatch') {
                    Fluttertoast.showToast(
                      msg: localizations.wrongOTPPleaseEnterCorrectOTP,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: localizations.somethingWentWrongOTP,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  }
                });
              },
              orElse: () {},
            );
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 40.r,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 70.w,
                    ),
                    child: Text(
                      localizations.otpVerification,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(
                            10.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: localizations.enterVerificaitonCode,
                                  style: TextStyle(
                                    color: theme.focusColor,
                                    fontSize: 18.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: widget.phoneNumber,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Edit',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.sp,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pop(
                                            context,
                                          );
                                        },
                                    ),
                                  ],
                                ),
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20.h,
                    ),
                    width: 300.w,
                    child: pinCodeFields.PinCodeTextField(
                      scrollPadding: EdgeInsets.only(
                        bottom: 600.h,
                      ),
                      appContext: context,
                      length: 6,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          // Enable the button only when the OTP is 6 digits
                          isButtonEnabled = value.length == 6;
                        });
                      },
                      controller: pinEditingController,
                      pinTheme: pinCodeFields.PinTheme(
                        shape: pinCodeFields.PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(
                          5.r,
                        ),
                        fieldHeight: 50.h,
                        fieldWidth: 40.w,
                        inactiveColor: theme.focusColor,
                        activeColor: theme.focusColor,
                        selectedColor: theme.focusColor,
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      obscuringCharacter: '*',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          localizations.didnotRecieveOtp,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          localizations.resend,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: isKeyboardOpen
                        ? 20.h
                        : 280.h, // Hide the SizedBox when the keyboard is open
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 167.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            OtpButton(
                              isLoading: isLoading,
                              buttonText: localizations.getStarted,
                              primary: true,
                              onPressed: isButtonEnabled
                                  ? () {
                                      // Only proceed if the button is enabled
                                      BlocProvider.of<LoginBloc>(
                                        context,
                                      ).add(
                                        LoginEvent.verifyLogin(
                                          attempts: 0,
                                          userType: UserType.user,
                                          phone: widget.phoneNumber,
                                          otp: pinEditingController.text,
                                        ),
                                      );
                                      setState(() {
                                        isLoading = true;
                                      });
                                    }
                                  : () {
                                      // Show a toast or snackbar for invalid OTP
                                      Fluttertoast.showToast(
                                        msg: localizations.enterValidOTP,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                      );
                                    },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class OtpButton extends StatelessWidget with SU {
  const OtpButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.isLoading,
    this.primary = false,
    this.expanded = true,
  });

  final String buttonText;
  final void Function() onPressed;
  final bool primary;
  final bool expanded;
  final bool isLoading;

  @override
  Widget build(
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: primary == false
            ? LuluBrandColor.brandPrimary
            : LuluBrandColor.brandWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16.r,
          ),
          side: const BorderSide(
            color: LuluBrandColor.brandPrimary,
          ),
        ),
        backgroundColor: primary == false
            ? LuluBrandColor.brandWhite
            : LuluBrandColor.brandPrimary,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 10.h,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 20.w,
              left: 20.w,
            ),
            child: Text(buttonText),
          ),
          if (isLoading)
            SpinKitChasingDots(
              size: 12.r,
              color: LuluBrandColor.brandWhite,
            ),
        ],
      ),
    );
  }
}
