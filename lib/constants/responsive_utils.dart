import 'package:flutter/material.dart';

import 'constants.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppDimensions.mobileBreakpoint &&
      MediaQuery.of(context).size.width < AppDimensions.tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppDimensions.tabletBreakpoint;

  static double getHorizontalPadding(BuildContext context) {
    if (isMobile(context)) return AppDimensions.mobilePadding;
    if (isTablet(context)) return AppDimensions.tabletPadding;
    return AppDimensions.desktopPadding;
  }

  static double getVerticalSpacing(
    BuildContext context, {
    bool isLarge = false,
  }) {
    final isMobileScreen = isMobile(context);
    if (isLarge) {
      return isMobileScreen ? 60 : 100;
    }
    return isMobileScreen ? 30 : 50;
  }

  static EdgeInsets getSectionPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: getHorizontalPadding(context),
      vertical: getVerticalSpacing(context, isLarge: true),
    );
  }

  static EdgeInsets getCardPadding(BuildContext context) {
    return EdgeInsets.all(isMobile(context) ? 20 : 30);
  }

  static double getProfileImageSize(BuildContext context) {
    return isMobile(context)
        ? AppDimensions.mobileProfileImageSize
        : AppDimensions.desktopProfileImageSize;
  }

  static double getProfileImageOffset(BuildContext context) {
    return isMobile(context)
        ? AppDimensions.mobileProfileImageOffset
        : AppDimensions.profileImageOffset;
  }

  // Text size helpers
  static double getHeadingSize(BuildContext context, {int level = 1}) {
    final isMobileScreen = isMobile(context);
    final isTabletScreen = isTablet(context);

    switch (level) {
      case 1:
        return isMobileScreen
            ? AppTextSizes.mobileH1
            : isTabletScreen
            ? AppTextSizes.tabletH1
            : AppTextSizes.desktopH1;
      case 2:
        return isMobileScreen
            ? AppTextSizes.mobileH2
            : isTabletScreen
            ? AppTextSizes.tabletH2
            : AppTextSizes.desktopH2;
      case 3:
        return isMobileScreen ? AppTextSizes.mobileH3 : AppTextSizes.tabletH3;
      default:
        return isMobileScreen
            ? AppTextSizes.mobileBody
            : AppTextSizes.tabletBody;
    }
  }

  static double getBodyTextSize(BuildContext context) {
    final isMobileScreen = isMobile(context);
    final isTabletScreen = isTablet(context);
    return isMobileScreen
        ? AppTextSizes.mobileBody
        : isTabletScreen
        ? AppTextSizes.tabletBody
        : AppTextSizes.desktopBody;
  }

  static double getCaptionTextSize(BuildContext context) {
    return isMobile(context)
        ? AppTextSizes.mobileSmall
        : AppTextSizes.tabletSmall;
  }

  // Button size helpers
  static EdgeInsets getButtonPadding(
    BuildContext context, {
    bool isLarge = false,
  }) {
    final isMobileScreen = isMobile(context);
    if (isLarge) {
      return EdgeInsets.symmetric(
        horizontal: isMobileScreen ? 20 : 28,
        vertical: isMobileScreen ? 14 : 18,
      );
    }
    return EdgeInsets.symmetric(
      horizontal: isMobileScreen ? 12 : 16,
      vertical: isMobileScreen ? 6 : 8,
    );
  }

  // Grid helpers
  static int getGridCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 3;
  }

  static double getGridSpacing(BuildContext context) {
    return isMobile(context) ? 16 : 32;
  }

  // Animation helpers
  static Duration getAnimationDuration({bool isLong = false}) {
    return isLong
        ? AppAnimations.fadeInDuration
        : AppAnimations.buttonHoverDuration;
  }

  // Responsive value helper
  static T responsive<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) return desktop;
    if (isTablet(context) && tablet != null) return tablet;
    return mobile;
  }
}
