import 'package:ekikrit/App/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  TextTheme get textTheme => TextTheme(

    titleLarge: GoogleFonts.getFont(
        Constants.appFont,
        fontSize: 16
    ),
    titleMedium: GoogleFonts.getFont(
      Constants.appFont,
      fontSize: 14
    ),
    titleSmall: GoogleFonts.getFont(
        Constants.appFont,
        fontSize: 12
    ),
    bodySmall: GoogleFonts.getFont(
        Constants.appFont,
        fontSize: 12
    ),

    headlineLarge: GoogleFonts.getFont(
        Constants.appFont,
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.w600
    ),


  );
}
