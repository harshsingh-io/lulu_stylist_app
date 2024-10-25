import 'package:flutter/material.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';

class LuluCardTheme {
  LuluCardTheme._();

  static CardTheme cardLightThemeData = const CardTheme(
    color: LuluBrandColor.brandWhite,
  );
  static CardTheme cardDarkThemeData = const CardTheme(
    color: LuluBrandColor.brandBlack,
  );
}
