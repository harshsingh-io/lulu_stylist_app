import 'package:flutter/widgets.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_typography.dart';

class LuluText extends StatelessWidget {
  LuluText.bodySmall({
    required this.title,
    super.key,
    this.style,
  }) {
    style ??= textLightTheme.bodySmall;
  }

  LuluText.bodyMedium({
    required this.title,
    super.key,
    this.style,
  }) {
    style ??= textLightTheme.bodyMedium;
  }

  LuluText.bodyLarge({
    required this.title,
    super.key,
    this.style,
  }) {
    style ??= textLightTheme.bodyLarge;
  }

  LuluText.labelSmall({
    required this.title,
    super.key,
    this.style,
  }) {
    style ??= textLightTheme.labelSmall;
  }

  LuluText.labelMedium({
    required this.title,
    super.key,
    this.style,
  }) {
    style ??= textLightTheme.labelMedium;
  }

  LuluText.labelLarge({
    required this.title,
    super.key,
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
