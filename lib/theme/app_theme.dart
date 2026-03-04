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

  // Modern 2026 Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, light],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [background, Color(0xFF5A6A75)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [dark, Color(0xFF333333)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

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
          fontWeight: FontWeight.w800,
          color: Colors.white,
          letterSpacing: -0.5,
        ),
        displayMedium: GoogleFonts.notoSans(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        titleLarge: GoogleFonts.notoSans(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: dark,
        ),
        bodyLarge: GoogleFonts.notoSans(
          fontSize: 16,
          color: dark,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.notoSans(
          fontSize: 14,
          color: dark.withOpacity(0.7),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.2),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: Colors.white.withOpacity(0.98),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.notoSans(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: dark,
          elevation: 4,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primary,
        unselectedItemColor: Colors.white60,
        backgroundColor: dark,
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: secondary,
        foregroundColor: Colors.white,
        elevation: 6,
      ),
    );
  }
}
