import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class Constants {
  static String appFont = "Inter";
  static const String stRupeeSymbol = '\u{20B9}';
 static const String googleCaptchaSiteKey='6Lc-CM4mAAAAAMakj1BogxTsNJj6Taxm4FliMoUx';
  // static String appFont = "Barlow";

  static FontWeight fontWeight600 = FontWeight.w600;
  static FontWeight fontWeight400 = FontWeight.w400;
  static FontWeight fontWeight500 = FontWeight.w500;
  static FontWeight fontWeight700 = FontWeight.w700;

  static double fontSizeLarge = 22;
  static double fontSize20 = 20;
  static double fontSize30 = 30;
  static double fontSize25 = 25;
  static double fontSizeHeading = 16;
  static double fontSizeText = 14;
  static double fontSizeDescription = 13;
  static double listItemBlurRadius = 3.0;
  static double listItemSpreadRadius = 1.0;
  static Offset listItemShadowOffset = const Offset(1, 1);

  static Color descriptionTextColor = Colors.black.withOpacity(0.5);

  // static Color appBackgroundPrimary = Color(0xfff6f3f1);
  // static Color appBackgroundPrimary = Color(0xffebe4e0).withOpacity(0.4);
  static Color appBackgroundPrimary = const Color(0xffF5F3F1);
  static Color appBackgroundPrimaryDark =
      const Color(0xffcfc7c0).withOpacity(1);
  static Color COLOR_ISABELLINE = const Color(0xFFF2F1EF);
  static Color accent = const Color(0xFF80B036);
  static Color accentLight = const Color(0xFFECF3E1);
  static const Color COLOR_WHITE_CHOCOLATE = Color(0xFFF8F8F1);
  static const Color COLOR_NEW_ORLEANS = Color(0xFFE3C087);
  static const Color COLOR_DIM_GRAY = Color(0xFF707070);
  static const Color COLOR_PATTENS_BLUE = Color(0xFFdcddde);
  static const Color COLOR_PAPAYA_WHIP = Color(0xFFFEEED8);
  static const Color COLOR_EGGSHELL = Color(0xFFE8F1DB);
  static const Color COLOR_DOUBLE_SPANISH_WHITE = Color(0xFFEED8BA);
  static const Color COLOR_DESERT_STORM = Color(0xFFF7F7F7);
  static const Color COLOR_MOON_GLOW = Color(0xFFFEFDD8);
  static const Color COLOR_DAWN_PINK = Color(0xFFEFEBEB);
  static const Color COLOR_THISTLE_GREEN = Color(0xFFBBCF9C);
  static const Color COLOR_SECONDARY_BROWN = Color(0xFFA57242);
  static const Color googleColor = const Color(0xffDF4A32);
  static const Color facebookColor = const Color(0xff39579A);
  static const Color COLOR_BLACK = const Color(0xff000000);
  static const Color COLOR_BUTTON_BORDER_GREY = const Color(0xffE1DDDD);
  static const Color COLOR_BUTTON_BG_CREAM = const Color(0xffF5F0EB);
  static final storageBox = GetStorage();
  static int appVersion = 1;
}
