import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_spacing.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LuluBottomSheet {
  static void showLarge({
    required BuildContext context,
    required Widget child,
    bool isDissmissable = false,
  }) {
    final widgetHeight = MediaQuery.of(context).size.height * 0.8;
    _show(
      context: context,
      child: child,
      height: widgetHeight,
      isDissmissable: isDissmissable,
    );
  }

  static void showMedium({
    required BuildContext context,
    required Widget child,
    bool isDissmissable = false,
  }) {
    final widgetHeight = MediaQuery.of(context).size.height * 0.6;
    _show(
      context: context,
      child: child,
      height: widgetHeight,
      isDissmissable: isDissmissable,
    );
  }

  static void showSmall({
    required BuildContext context,
    required Widget child,
    bool isDissmissable = false,
  }) {
    final widgetHeight = MediaQuery.of(context).size.height * 0.4;
    _show(
      context: context,
      child: child,
      height: widgetHeight,
      isDissmissable: isDissmissable,
    );
  }

  static void _show({
    required BuildContext context,
    required Widget child,
    required double height,
    bool isDissmissable = false,
  }) {
    final theme = Theme.of(context);
    if (Platform.isAndroid) {
      // Android-specific code
      showMaterialModalBottomSheet(
        context: context,
        isDismissible: false,
        useRootNavigator: true,
        builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: height,
            child: Container(
              padding: const EdgeInsets.all(LuluSpacing.sm),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    LuluSpacing.sm,
                  ),
                  topLeft: Radius.circular(
                    LuluSpacing.sm,
                  ),
                ),
              ),
              child: child,
            ),
          ),
        ),
      );
    } else if (Platform.isIOS) {
      showCupertinoModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            child: Container(
              padding: const EdgeInsets.all(LuluSpacing.sm),
              width: height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    LuluSpacing.sm,
                  ),
                  topLeft: Radius.circular(
                    LuluSpacing.sm,
                  ),
                ),
              ),
              child: child,
            ),
          ),
        ),
      );
    }
  }
}
