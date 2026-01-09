import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // Color Scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2563EB), // Blue/Indigo accent
      brightness: Brightness.light,
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),

    // Scaffold
    scaffoldBackgroundColor: const Color(0xFFF8FAFC),

    // Card Theme with Indigo Shadow
    cardTheme: CardThemeData(
      elevation: 4,
      shadowColor: Colors.indigo, // Indigo shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
    ),

    // Input Fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadowColor: Colors.indigo, // Indigo shadow for buttons
        elevation: 4,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white
      ),
    ),

    // ListTile
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      tileColor: Colors.white,
      // Shadow on ListTile is only via Card or Material widget
    ),

    // Typography
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    ),
  );
}
