import 'package:flutter/widgets.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_typography.dart';

class LuluText extends StatelessWidget {
  LuluText.bodySmall({
    super.key,
    required this.title,
    this.style,
  }) {
    style ??= textLightTheme.bodySmall;
  }

  LuluText.bodyMedium({
    super.key,
    required this.title,
    this.style,
  }) {
    style ??= textLightTheme.bodyMedium;
  }

  LuluText.bodyLarge({
    super.key,
    required this.title,
    this.style,
  }) {
    style ??= textLightTheme.bodyLarge;
  }

  LuluText.labelSmall({
    super.key,
    required this.title,
    this.style,
  }) {
    style ??= textLightTheme.labelSmall;
  }

  LuluText.labelMedium({
    super.key,
    required this.title,
    this.style,
  }) {
    style ??= textLightTheme.labelMedium;
  }

  LuluText.labelLarge({
    super.key,
    required this.title,
    this.style,
  }) {
    style ??= textLightTheme.labelLarge;
  }

  // LuluText({super.key, required this.title});
  String title;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: style);
  }
}
