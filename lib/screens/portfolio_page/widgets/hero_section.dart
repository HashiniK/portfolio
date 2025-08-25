import 'package:flutter/material.dart';

import 'package:hashini_portfolio/constants/app_colors.dart';
import 'package:hashini_portfolio/constants/constants.dart';
import 'package:hashini_portfolio/constants/app_styles.dart';
import 'package:hashini_portfolio/constants/responsive_utils.dart';

class HeroSection extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final VoidCallback onGetInTouchPressed;

  const HeroSection({
    super.key,
    required this.fadeAnimation,
    required this.onGetInTouchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: ResponsiveUtils.getSectionPadding(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppConstants.greeting,
              style: AppTextStyles.greeting(context),
            ),
            SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
            Flexible(
              child: Text(
                AppConstants.fullName,
                style: AppTextStyles.heading1(context),
              ),
            ),
            SizedBox(height: AppDimensions.smallSpacing),
            Flexible(
              child: Text(
                AppConstants.tagline,
                style: AppTextStyles.heading2(context),
              ),
            ),
            SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
            Flexible(
              child: SizedBox(
                width: ResponsiveUtils.isMobile(context)
                    ? double.infinity
                    : 540,
                child: Text(
                  AppConstants.introDescription,
                  style: AppTextStyles.body(context),
                ),
              ),
            ),
            SizedBox(height: ResponsiveUtils.getVerticalSpacing(context, isLarge: true)),
            _buildGetInTouchButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGetInTouchButton(BuildContext context) {
    return Container(
      decoration: AppDecorations.buttonDecoration,
      child: TextButton(
        onPressed: onGetInTouchPressed,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: ResponsiveUtils.getButtonPadding(context, isLarge: true),
        ),
        child: Text(
          AppConstants.getInTouchLabel,
          style: AppTextStyles.button(context),
        ),
      ),
    );
  }
}
