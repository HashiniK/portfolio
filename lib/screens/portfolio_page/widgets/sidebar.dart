import 'package:flutter/material.dart';

import 'package:hashini_portfolio/constants/constants.dart';
import 'package:hashini_portfolio/constants/app_colors.dart';
import 'package:hashini_portfolio/constants/app_styles.dart';

class Sidebar {
  static Widget left({required Function(String) onSocialPressed}) {
    return Container(
      width: AppDimensions.sidebarWidth,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildSocialIcon(
            Icons.work,
            AppConstants.linkedinUrl,
            onSocialPressed,
          ),
          const SizedBox(height: 20),
          _buildSocialIcon(Icons.code, AppConstants.githubUrl, onSocialPressed),
          const SizedBox(height: 20),
          _buildSocialIcon(
            Icons.email,
            AppConstants.mailtoUrl,
            onSocialPressed,
          ),
          const SizedBox(height: 20),
          Container(
            width: 1,
            height: AppDimensions.sidebarLineHeight,
            color: AppColors.primary,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static Widget right() {
    return Container(
      width: AppDimensions.sidebarWidth,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const RotatedBox(
            quarterTurns: 1,
            child: Text(
              AppConstants.email,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontFamily: AppTextStyles.monoFont,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 1,
            height: AppDimensions.sidebarLineHeight,
            color: AppColors.primary,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static Widget _buildSocialIcon(
    IconData icon,
    String url,
    Function(String) onPressed,
  ) {
    return GestureDetector(
      onTap: () => onPressed(url),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Icon(icon, color: AppColors.textSecondary, size: 20),
      ),
    );
  }
}
