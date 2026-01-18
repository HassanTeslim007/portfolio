import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF0F0F0F);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color accent = Color(0xFF50C878); // Emerald Green
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;

  static const Color lightBackground = Color(0xFFFAFAFA);
  static const Color lightSurface = Colors.white;
  static const Color lightTextPrimary = Color(0xFF121212);
  static const Color lightTextSecondary = Color(0xFF424242);

  static ThemeData darkTheme = _buildTheme(Brightness.dark);
  static ThemeData lightTheme = _buildTheme(Brightness.light);

  static ThemeData _buildTheme(Brightness brightness) {
    bool isDark = brightness == Brightness.dark;
    Color bg = isDark ? background : lightBackground;
    Color surf = isDark ? surface : lightSurface;
    Color primaryText = isDark ? textPrimary : lightTextPrimary;
    Color secondaryText = isDark ? textSecondary : lightTextSecondary;

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: bg,
      colorScheme: isDark
          ? const ColorScheme.dark(
              surface: surface,
              onSurface: textPrimary,
              primary: accent,
              secondary: accent,
            )
          : const ColorScheme.light(
              surface: lightSurface,
              onSurface: lightTextPrimary,
              primary: accent,
              secondary: accent,
            ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: primaryText,
          letterSpacing: -1.0,
        ),
        headlineMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        bodyLarge: TextStyle(fontSize: 18, color: secondaryText, height: 1.5),
        bodyMedium: TextStyle(fontSize: 16, color: secondaryText),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: isDark ? Colors.black : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      cardTheme: CardThemeData(
        color: surf,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
