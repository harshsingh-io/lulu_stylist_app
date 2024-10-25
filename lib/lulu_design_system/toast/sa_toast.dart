import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lulu_stylist_app/app/view/app.dart';

class LuluToast {
  static void showToast({
    required String title,
    required String message,
    required ContentType contentType,
  }) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: contentType,
      ),
    );

    //TODO: FIX TOAST GLOBAL KEY NAVIGATION
    // App.scaffoldMessengerKey.currentState
    //   ?..hideCurrentSnackBar()
    //   ..showSnackBar(snackBar);

    // ScaffoldMessenger.of(context)
    //   ..hideCurrentMaterialBanner()
    //   ..showMaterialBanner(materialBanner);
  }

  static void showDebugToast({
    required String title,
    required String message,
    required ContentType contentType,
  }) {
    if (kDebugMode) {
      showToast(title: title, message: message, contentType: contentType);
    }
  }
}
