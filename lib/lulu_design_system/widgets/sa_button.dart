// ignore_for_file: unused_import

import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_spacing.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    as widget_book;

enum LuluButtonColor {
  primary(LuluBrandColor.brandPrimary),
  secondary(LuluBrandColor.brandSecondary),
  white(LuluBrandColor.brandWhite);

  final Color color;

  const LuluButtonColor(this.color);
}

class LuluButton extends StatelessWidget {
  // const LuluButton({
  //   super.key,
  //   this.label,
  //   this.icon,
  //   this.color = LuluButtonColor.primary,
  //   this.onPressed,
  // })  : _primary = true,
  //       assert(
  //           label != null || icon != null, 'Label or icon must be provided.');
  // // Use asserts to enforce rules which cannot be done at compile time

  const LuluButton.primary({
    super.key,
    required this.label,
    this.icon,
    this.color = LuluButtonColor.primary,
    this.onPressed,
    this.isLoading = false,
  })  : _primary = true,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  const LuluButton.secondary({
    required this.label,
    super.key,
    this.icon,
    this.color = LuluButtonColor.primary,
    this.onPressed,
    this.isLoading = false,
  })  : _primary = false,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );
  final String? label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final LuluButtonColor color;
  final bool _primary;
  final bool isLoading;

  Widget _buildLoading(BuildContext context, LuluButtonColor color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      // Icon, icon + text, and text-only possibilities are abstracted in MyButton
      children: [
        if (icon != null) Icon(icon, size: LuluSpacing.sm),
        if (icon != null && label != null)
          const SizedBox(width: LuluSpacing.lg),
        if (isLoading)
          LoadingAnimationWidget.progressiveDots(
            color: color.color,
            size: LuluSpacing.md,
          ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, LuluButtonColor color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      // Icon, icon + text, and text-only possibilities are abstracted in MyButton
      children: [
        if (icon != null) Icon(icon, size: LuluSpacing.sm),
        if (icon != null && label != null)
          const SizedBox(width: LuluSpacing.lg),
        if (label != null)
          Text(
            label!,
            style: const TextStyle(
              color: LuluBrandColor.brandWhite,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // final child = Row(
    //   mainAxisSize: MainAxisSize.min,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   // Icon, icon + text, and text-only possibilities are abstracted in MyButton
    //   children: [
    //     if (icon != null) Icon(icon, size: 18.0),
    //     if (icon != null && label != null) const SizedBox(width: 8),
    //     if (label != null)
    //       Text(
    //         label!,
    //         textAlign: TextAlign.center,
    //         style: const TextStyle(
    //           color: LuluBrandColor.brandWhite,
    //         ),
    //       ),
    //   ],
    // );

    const buttonPadding = EdgeInsetsDirectional.symmetric(
      vertical: LuluSpacing.md / 2,
      horizontal: LuluSpacing.md,
    );

    if (!kIsWeb && Platform.isIOS) {
      final themeData = CupertinoTheme.of(context);

      if (_primary) {
        final button = CupertinoButton.filled(
          padding: buttonPadding,
          onPressed: onPressed,
          child: isLoading
              ? _buildLoading(context, LuluButtonColor.white)
              : _buildButton(context, LuluButtonColor.white),
        );

        return CupertinoTheme(
          data: themeData.copyWith(primaryColor: color.color),
          child: button,
        );
      } else {
        return CupertinoTheme(
          data: themeData.copyWith(primaryColor: color.color),
          child: CupertinoButton(
            padding: buttonPadding,
            onPressed: onPressed,
            child: isLoading
                ? _buildLoading(context, LuluButtonColor.primary)
                : _buildButton(context, LuluButtonColor.primary),
          ),
        );
      }
    }

    if (_primary) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color.color,
          padding: buttonPadding,
        ),
        onPressed: isLoading ? () {} : onPressed,
        child: _buildButton(context, LuluButtonColor.white),
      );
    } else {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: buttonPadding,
          foregroundColor: color.color,
          side: BorderSide(color: color.color),
        ),
        onPressed: isLoading ? () {} : onPressed,
        child: _buildButton(context, LuluButtonColor.primary),
      );
    }
  }
}
