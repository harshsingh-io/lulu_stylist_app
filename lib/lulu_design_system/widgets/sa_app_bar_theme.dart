import 'package:flutter/material.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';

class LuluAppBarTheme {
  LuluAppBarTheme._();

  static AppBarTheme appBarLightThemeData = const AppBarTheme(
    color: LuluBrandColor.mainBackgroundColor,
  );
  static AppBarTheme appBarDarkThemeData = const AppBarTheme(
    color: LuluBrandColor.brandBlack,
  );
}
