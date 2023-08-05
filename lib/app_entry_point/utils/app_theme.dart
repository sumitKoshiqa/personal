import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppTheme {
  String font_family = 'SfProDisplay';

  static const int _greenPrimaryValue = 0xFF7FB036;

  static final primaryColor = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(0xFFA5D6A7),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(_greenPrimaryValue),
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );

  TextTheme get textTheme => TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 15.spMin,
          fontWeight: FontWeight.normal,
          fontFamily: font_family,
        ),
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 14.spMin,
          fontFamily: font_family,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 16.spMin,
          fontWeight: FontWeight.w600,
          fontFamily: font_family,
        ),
        titleSmall: TextStyle(
          color: Colors.black,
          fontFamily: font_family,
          fontSize: 12.spMin,
          fontWeight: FontWeight.w600,
        ),
        displayLarge: TextStyle(
          color: Colors.black,
          fontFamily: font_family,
          fontSize: 42.spMin,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          color: Colors.black,
          fontFamily: font_family,
          fontSize: 30.spMin,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: Colors.black,
          fontFamily: font_family,
          fontSize: 26.spMin,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: Colors.black,
          fontFamily: font_family,
          fontSize: 22.spMin,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: Colors.black,
          fontFamily: font_family,
          fontSize: 20.spMin,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: Colors.black,
          fontFamily: font_family,
          fontSize: 18.spMin,
          fontWeight: FontWeight.w600,
        ),
        bodySmall: TextStyle(
          color: Colors.black,
          fontFamily: font_family,
          fontSize: 12.spMin,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontSize: 11.spMin,
          fontFamily: font_family,
        ),
        labelSmall: TextStyle(
          color: Colors.black,
          fontFamily: font_family,
          fontSize: 9.spMin,
        ),
      );
}
