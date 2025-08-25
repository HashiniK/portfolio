import 'package:flutter/material.dart';
import 'package:hashini_portfolio/constants/constants.dart';
import 'package:hashini_portfolio/constants/app_colors.dart';
import 'package:hashini_portfolio/constants/app_styles.dart';
import 'package:hashini_portfolio/constants/responsive_utils.dart';

class ContactSection extends StatelessWidget {
  final VoidCallback onGetInTouchPressed;

  const ContactSection({super.key, required this.onGetInTouchPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ResponsiveUtils.getSectionPadding(context),
      child: Column(
        children: [
          Text(
            AppConstants.contactSectionNumber,
            style: AppTextStyles.greeting(context),
          ),
          SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
          Text(
            AppConstants.contactTitle,
            style: AppTextStyles.heading1(context).copyWith(
              fontSize:
                  ResponsiveUtils.getHeadingSize(context, level: 1) * 0.75,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
          SizedBox(
            width: ResponsiveUtils.isMobile(context) ? double.infinity : 600,
            child: Text(
              AppConstants.contactDescription,
              style: AppTextStyles.body(context),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: ResponsiveUtils.getVerticalSpacing(context, isLarge: true),
          ),
          Container(
            decoration: AppDecorations.buttonDecoration,
            child: TextButton(
              onPressed: onGetInTouchPressed,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                padding: ResponsiveUtils.getButtonPadding(
                  context,
                  isLarge: true,
                ),
              ),
              child: Text(
                AppConstants.sayHelloLabel,
                style: AppTextStyles.button(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
