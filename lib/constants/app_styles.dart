import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'constants.dart';


class AppTextStyles {
  // Font Families
  static const String primaryFont = 'Calibre';
  static const String monoFont = 'SF Mono';

  // Base Text Styles
  static const TextStyle _baseStyle = TextStyle(
    fontFamily: primaryFont,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  static const TextStyle _monoStyle = TextStyle(
    fontFamily: monoFont,
    color: AppColors.textAccent,
  );

  // Heading Styles
  static TextStyle heading1(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;
    final isTablet =
        MediaQuery.of(context).size.width < AppDimensions.tabletBreakpoint;

    return _baseStyle.copyWith(
      fontSize: isMobile
          ? AppTextSizes.mobileH1
          : isTablet
          ? AppTextSizes.tabletH1
          : AppTextSizes.desktopH1,
      fontWeight: FontWeight.w600,
      height: 1.1,
    );
  }

  static TextStyle heading2(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;
    final isTablet =
        MediaQuery.of(context).size.width < AppDimensions.tabletBreakpoint;

    return _baseStyle.copyWith(
      fontSize: isMobile
          ? AppTextSizes.mobileH2
          : isTablet
          ? AppTextSizes.tabletH2
          : AppTextSizes.desktopH2,
      fontWeight: FontWeight.w600,
      color: AppColors.textSecondary,
      height: 1.1,
    );
  }

  static TextStyle heading3(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;

    return _baseStyle.copyWith(
      fontSize: isMobile ? AppTextSizes.mobileH3 : AppTextSizes.tabletH3,
      fontWeight: FontWeight.w600,
    );
  }

  // Body Text Styles
  static TextStyle body(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;
    final isTablet =
        MediaQuery.of(context).size.width < AppDimensions.tabletBreakpoint;

    return _baseStyle.copyWith(
      fontSize: isMobile
          ? AppTextSizes.mobileBody
          : isTablet
          ? AppTextSizes.tabletBody
          : AppTextSizes.desktopBody,
      color: AppColors.textSecondary,
    );
  }

  static TextStyle bodyLarge(BuildContext context) {
    return body(context).copyWith(fontSize: body(context).fontSize! + 2);
  }

  static TextStyle caption(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;

    return _baseStyle.copyWith(
      fontSize: isMobile ? AppTextSizes.mobileSmall : AppTextSizes.tabletSmall,
      color: AppColors.textSecondary,
    );
  }

  // Specialized Styles
  static TextStyle greeting(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;

    return _monoStyle.copyWith(
      fontSize: isMobile ? AppTextSizes.mobileSmall : AppTextSizes.tabletSmall,
    );
  }

  static TextStyle sectionNumber(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;

    return _monoStyle.copyWith(
      fontSize: isMobile
          ? AppTextSizes.mobileSectionNumberSize
          : AppTextSizes.sectionNumberSize,
    );
  }

  static TextStyle techItem(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;

    return _monoStyle.copyWith(
      fontSize: isMobile ? AppTextSizes.mobileSmall : AppTextSizes.tabletSmall,
      color: AppColors.textSecondary,
    );
  }

  static TextStyle navButton(BuildContext context) {
    return const TextStyle(
      fontFamily: monoFont,
      fontSize: 12,
      color: AppColors.textAccent,
    );
  }

  static TextStyle navButtonText(BuildContext context) {
    return const TextStyle(
      fontFamily: primaryFont,
      fontSize: 14,
      color: AppColors.textSecondary,
    );
  }

  static TextStyle button(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;

    return _monoStyle.copyWith(
      fontSize: isMobile ? AppTextSizes.mobileSmall : AppTextSizes.tabletSmall,
    );
  }

  static TextStyle logo(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;

    return _monoStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: isMobile ? 16 : 20,
    );
  }
}

class AppDecorations {
  // Border Decorations
  static BoxDecoration primaryBorder = BoxDecoration(
    border: Border.all(color: AppColors.primary, width: 2),
    borderRadius: BorderRadius.circular(4),
  );

  static BoxDecoration secondaryBorder = BoxDecoration(
    border: Border.all(color: AppColors.primary, width: 1),
    borderRadius: BorderRadius.circular(4),
  );

  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(4),
    border: Border.all(color: AppColors.borderLight),
  );

  // Profile Image Decoration
  static BoxDecoration profileImageDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: AppColors.surfaceOverlay,
  );

  static BoxDecoration profileImageBorder = BoxDecoration(
    border: Border.all(color: AppColors.primary, width: 2),
    borderRadius: BorderRadius.circular(4),
  );

  // Button Decorations
  static BoxDecoration buttonDecoration = BoxDecoration(
    border: Border.all(color: AppColors.primary, width: 1),
    borderRadius: BorderRadius.circular(4),
  );
}

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    primarySwatch: Colors.teal,
    fontFamily: AppTextStyles.primaryFont,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: AppColorScheme.darkColorScheme,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: AppTextStyles.primaryFont,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      displayMedium: TextStyle(
        fontFamily: AppTextStyles.primaryFont,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      headlineLarge: TextStyle(
        fontFamily: AppTextStyles.primaryFont,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontFamily: AppTextStyles.primaryFont,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontFamily: AppTextStyles.primaryFont,
        height: 1.6,
        color: AppColors.textSecondary,
      ),
      bodyMedium: TextStyle(
        fontFamily: AppTextStyles.primaryFont,
        height: 1.6,
        color: AppColors.textSecondary,
      ),
    ),
  );
}
