import 'package:flutter/material.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';

class LuluBottomNavBarTheme {
  LuluBottomNavBarTheme._();

  static BottomNavigationBarThemeData bottomNavigationLightTheme =
      const BottomNavigationBarThemeData(
    backgroundColor: LuluBrandColor.brandWhite,
    selectedItemColor: LuluBrandColor.brandPrimary,
    unselectedItemColor: LuluBrandColor.brandBlack,
    selectedIconTheme: IconThemeData(
      color: LuluBrandColor.brandPrimary,
    ),
    unselectedIconTheme: IconThemeData(
      color: LuluBrandColor.brandBlack,
    ),
    unselectedLabelStyle: TextStyle(
      color: LuluBrandColor.brandBlack,
    ),
    selectedLabelStyle: TextStyle(
      color: LuluBrandColor.brandPrimary,
    ),
  );
  static BottomNavigationBarThemeData bottomNavigationDarkTheme =
      const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: LuluBrandColor.brandPrimary,
    unselectedItemColor: LuluBrandColor.brandWhite,
    selectedIconTheme: IconThemeData(
      color: LuluBrandColor.brandPrimary,
    ),
    unselectedIconTheme: IconThemeData(
      color: LuluBrandColor.brandWhite,
    ),
    unselectedLabelStyle: TextStyle(
      color: LuluBrandColor.brandWhite,
    ),
    selectedLabelStyle: TextStyle(
      color: LuluBrandColor.brandPrimary,
    ),
  );
}
