import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryOrange = Color(0xFFF58235);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: primaryOrange,
      primary: primaryOrange,
      secondary: const Color(0xFF2D3142),
      surface: Colors.white,
      onSurface: const Color(0xFF2D3142),
      onSurfaceVariant: const Color(0xFF9098B1),
      surfaceContainerHighest: const Color(0xFFF1F2F6),
      primaryContainer: const Color(0xFFFFF2E5),
    ),
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    shadowColor: Colors.black,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: primaryOrange,
      primary: primaryOrange,
      secondary: Colors.white,
      surface: const Color(0xFF1E1E1E),
      onSurface: Colors.white,
      onSurfaceVariant: Colors.white70,
      surfaceContainerHighest: const Color(0xFF2C2C2C),
      primaryContainer: const Color(0xFF332211), // Darkened orange tint
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    shadowColor: Colors.black,
  );
}
