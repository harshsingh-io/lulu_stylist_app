import 'package:flutter/material.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_typography.dart';
import 'package:lulu_stylist_app/lulu_design_system/widgets/sa_app_bar_theme.dart';
import 'package:lulu_stylist_app/lulu_design_system/widgets/sa_bottom_nav_bar.dart';
import 'package:lulu_stylist_app/lulu_design_system/widgets/sa_card_theme.dart';

class LuluTheme {
  LuluTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    disabledColor: LuluBrandColor.brandDarkGrey50,
    brightness: Brightness.light,
    primaryColor: LuluBrandColor.brandPrimary,
    cardColor: LuluBrandColor.brandWhite,
    highlightColor: LuluBrandColor.brandWhite,
    focusColor: LuluBrandColor.brandBlack,
    textTheme: textLightTheme,
    cardTheme: LuluCardTheme.cardLightThemeData,
    scaffoldBackgroundColor: LuluBrandColor.brandWhite,
    bottomNavigationBarTheme: LuluBottomNavBarTheme.bottomNavigationLightTheme,
    // appBarTheme: LuluAppBarTheme.appBarLightThemeData,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: LuluBrandColor.brandDarkGrey50,
    brightness: Brightness.dark,
    primaryColor: LuluBrandColor.brandPrimary,
    cardColor: Colors.black,
    highlightColor: LuluBrandColor.brandBlack,
    focusColor: LuluBrandColor.brandWhite,
    textTheme: textdarkTheme,
    cardTheme: LuluCardTheme.cardDarkThemeData,
    scaffoldBackgroundColor: LuluBrandColor.brandBlack,
    bottomNavigationBarTheme: LuluBottomNavBarTheme.bottomNavigationDarkTheme,
    // appBarTheme: LuluAppBarTheme.appBarDarkThemeData,
  );
}
