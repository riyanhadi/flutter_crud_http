import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_crud_http/shared/theme/theme_config.dart';
import 'package:flutter/material.dart';

ThemeData getDefaultTheme() {
  return ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.grey[300],
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0.6,
      titleTextStyle: GoogleFonts.lato(
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: primaryColor,
      unselectedLabelStyle: TextStyle(
        color: whiteColor,
      ),
      selectedLabelStyle: TextStyle(
        color: whiteColor,
      ),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.blueGrey[900]!,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.roboto(
        color: textColor,
      ),
      titleMedium: GoogleFonts.roboto(
        color: textColor,
      ),
      titleLarge: GoogleFonts.roboto(
        color: textColor,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: textColor,
      ),
      bodySmall: GoogleFonts.roboto(
        color: textColor,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: textColor,
      ),
      labelLarge: GoogleFonts.roboto(
        color: textColor,
      ),
      labelMedium: GoogleFonts.roboto(
        color: textColor,
      ),
      labelSmall: GoogleFonts.roboto(
        color: textColor,
      ),
      displayLarge: GoogleFonts.roboto(
        color: textColor,
      ),
      displayMedium: GoogleFonts.roboto(
        color: textColor,
      ),
      displaySmall: GoogleFonts.roboto(
        color: textColor,
      ),
      headlineLarge: GoogleFonts.roboto(
        color: textColor,
      ),
      headlineMedium: GoogleFonts.roboto(
        color: textColor,
      ),
      headlineSmall: GoogleFonts.roboto(
        color: textColor,
      ),
    ),
  );
}
