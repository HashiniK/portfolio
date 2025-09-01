import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF64FFDA);
  static const Color background = Color(0xFF0A192F);
  static const Color surface = Color(0xFF112240);
  static const Color surfaceVariant = Color(0xFF233554);

  // Text Colors
  static const Color textPrimary = Color(0xFFCCD6F6);
  static const Color textSecondary = Color(0xFF8892B0);
  static const Color textAccent = Color(0xFF64FFDA);

  // Interaction States
  static const Color hover = Color(0xFF64FFDA);
  static const Color pressed = Color(0xFF4DCFB3);
  static const Color disabled = Color(0xFF5A6B8A);

  // Status Colors
  static const Color success = Color(0xFF0A192F);
  static Color error = Colors.red[100]!;
  static Color warning = Colors.orange[100]!;
  static Color info = Colors.blue[300]!;

  // Overlay Colors
  static Color overlay = Colors.black.withOpacity(0.8);
  static Color surfaceOverlay = primary.withOpacity(0.1);
  static Color imageOverlay = const Color(0xFFE1FFF6);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF4DCFB3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Border Colors
  static const Color border = Color(0xFF233554);
  static const Color borderAccent = primary;
  static Color borderLight = primary.withOpacity(0.1);
}

class AppColorScheme {
  static ColorScheme get darkColorScheme => const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.primary,
    surface: AppColors.surface,
    background: AppColors.background,
    onPrimary: AppColors.background,
    onSecondary: AppColors.background,
    onSurface: AppColors.textPrimary,
    onBackground: AppColors.textPrimary,
  );
}
