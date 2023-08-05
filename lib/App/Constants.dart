import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class Constants{
  static String appFont = "Manrope";
  // static String appFont = "Barlow";

  static double fontSizeLarge = 22;
  static double fontSizeHeading = 16;
  static double fontSizeText = 14;
  static double fontSizeDescription = 13;
  static double listItemBlurRadius = 3.0;
  static double listItemSpreadRadius = 1.0;
  static Offset listItemShadowOffset = const Offset(1, 1);

  static Color descriptionTextColor = Colors.black.withOpacity(0.5);

  static Color accentOrange = const Color(0xffFAA927);
  static Color accentGreen = const Color(0xff7A992D);
  static Color lightGreen = const Color(0xffEFF5E0);
  static Color lightOrange = const Color(0xffFEF8EE);


  static final storageBox = GetStorage();
  static int appVersion = 1;

}