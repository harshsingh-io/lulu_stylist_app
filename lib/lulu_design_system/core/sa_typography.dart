// Example typography.dart file
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';

var _fontFamily = (!kIsWeb && Platform.isIOS) ? '.SF UI Text' : 'Roboto';

double fontSizeXs = 12;
double fontSizeSmall = 18;
double fontSizeMd = 24;
double fontSizelg = 30;
double fontSizexl = 48;

const textLightColor = LuluBrandColor.brandBlack;
const textDarkColor = LuluBrandColor.brandWhite;

TextTheme textLightTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
    color: textLightColor,
  ),
  displayMedium: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 45,
    height: 52 / 45,
    color: textLightColor,
  ),
  displaySmall: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 36,
    height: 44 / 36,
    color: textLightColor,
  ),
  headlineLarge: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 40 / 32,
    color: textLightColor,
  ),
  headlineMedium: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 28,
    height: 36 / 28,
    color: textLightColor,
  ),
  headlineSmall: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 32 / 24,
    color: textLightColor,
  ),
  titleLarge: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 28 / 22,
    color: textLightColor,
  ),
  titleMedium: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.1,
    color: textLightColor,
  ),
  titleSmall: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: textLightColor,
  ),
  labelLarge: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 20 / 14,
    color: textLightColor,
  ),
  labelMedium: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 16 / 12,
    color: textLightColor,
  ),
  labelSmall: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 11,
    height: 16 / 11,
    color: textLightColor,
  ),
  bodyLarge: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
  ),
  bodyMedium: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    color: textLightColor,
  ),
  bodySmall: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
    color: textLightColor,
  ),
);

TextTheme textdarkTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
    color: textDarkColor,
  ),
  displayMedium: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 45,
    height: 52 / 45,
    color: textDarkColor,
  ),
  displaySmall: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 36,
    height: 44 / 36,
    color: textDarkColor,
  ),
  headlineLarge: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 40 / 32,
    color: textDarkColor,
  ),
  headlineMedium: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 28,
    height: 36 / 28,
    color: textDarkColor,
  ),
  headlineSmall: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 32 / 24,
    color: textDarkColor,
  ),
  titleLarge: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 28 / 22,
    color: textLightColor,
  ),
  titleMedium: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.1,
    color: textDarkColor,
  ),
  titleSmall: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: textDarkColor,
  ),
  labelLarge: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 20 / 14,
    color: textDarkColor,
  ),
  labelMedium: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 16 / 12,
    color: textDarkColor,
  ),
  labelSmall: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 11,
    height: 16 / 11,
    color: textDarkColor,
  ),
  bodyLarge: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
  ),
  bodyMedium: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    color: textDarkColor,
  ),
  bodySmall: TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
    color: textDarkColor,
  ),
);
