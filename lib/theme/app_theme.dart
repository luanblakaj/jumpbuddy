import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Original Warm Color Palette
  static const Color primary = Color(0xFFE3DB9A); // pale yellow
  static const Color secondary = Color(0xFFB1C2B3); // muted green
  static const Color danger = Color(0xFFC99792); // dusty rose
  static const Color light = Color(0xFFC7B773); // darker yellow
  static const Color dark = Color(0xFF222222); // black
  static const Color background = Color(0xFF778691); // slate gray

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        onPrimary: dark,
        secondary: secondary,
        onSecondary: Colors.white,
        error: danger,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: dark,
        outline: light,
      ),
      scaffoldBackgroundColor: background,
      textTheme: GoogleFonts.notoSansTextTheme().copyWith(
        displayLarge: GoogleFonts.notoSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        displayMedium: GoogleFonts.notoSans(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleLarge: GoogleFonts.notoSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: dark,
        ),
        bodyLarge: GoogleFonts.notoSans(
          fontSize: 16,
          color: dark,
        ),
        bodyMedium: GoogleFonts.notoSans(
          fontSize: 14,
          color: dark.withOpacity(0.8),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white.withOpacity(0.95),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: dark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: dark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: dark,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primary,
        unselectedItemColor: Colors.white70,
        backgroundColor: dark,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: secondary,
        foregroundColor: Colors.white,
      ),
    );
  }
}
