import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tenis_court/ui/theme/color.dart';

class AppThemeData {
  const AppThemeData._();

  static ThemeData get light {
    return ThemeData.light().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightColor.appleGreen,
          foregroundColor: LightColor.white,
          textStyle: GoogleFonts.poppins(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          minimumSize: const Size.fromHeight(50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
