import 'package:flutter/material.dart';
import 'package:hashini_portfolio/constants/app_colors.dart';
import 'package:hashini_portfolio/constants/app_styles.dart';
import 'package:hashini_portfolio/constants/constants.dart';

class NavigationHeader {
  static Widget mobile({
    required VoidCallback onMenuPressed,
    required VoidCallback onResumePressed,
  }) {
    return SliverAppBar(
      expandedHeight: 0,
      floating: true,
      pinned: true,
      backgroundColor: AppColors.background.withOpacity(0.95),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primary),
          onPressed: onMenuPressed,
        ),
      ),
      title: Container(
        padding: const EdgeInsets.all(8),
        decoration: AppDecorations.primaryBorder,
        child: const Text(
          AppConstants.appName,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: AppTextStyles.monoFont,
          ),
        ),
      ),
      actions: [
        _buildResumeButton(onResumePressed, isMobile: true),
        const SizedBox(width: 20),
      ],
    );
  }

  static Widget desktop({
    required Function(double) onNavPressed,
    required VoidCallback onResumePressed,
  }) {
    return SliverAppBar(
      expandedHeight: 0,
      floating: true,
      pinned: true,
      backgroundColor: AppColors.background.withOpacity(0.95),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Container(
        padding: const EdgeInsets.all(10),
        decoration: AppDecorations.primaryBorder,
        child: const Text(
          AppConstants.appName,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: AppTextStyles.monoFont,
          ),
        ),
      ),
      actions: [
        _buildNavButton(
          AppConstants.aboutNumber,
          AppConstants.aboutLabel,
          () => onNavPressed(AppScrollOffsets.aboutOffset),
        ),
        _buildNavButton(
          AppConstants.experienceNumber,
          AppConstants.experienceLabel,
          () => onNavPressed(AppScrollOffsets.experienceOffset),
        ),
        _buildNavButton(
          AppConstants.projectsNumber,
          AppConstants.projectsLabel,
          () => onNavPressed(AppScrollOffsets.projectsOffset),
        ),
        _buildNavButton(
          AppConstants.contactNumber,
          AppConstants.contactLabel,
          () => onNavPressed(AppScrollOffsets.contactOffset),
        ),
        const SizedBox(width: 20),
        _buildResumeButton(onResumePressed),
        const SizedBox(width: 40),
      ],
    );
  }

  static Widget _buildNavButton(
    String number,
    String text,
    VoidCallback onPressed,
  ) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: AppColors.textSecondary),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: number,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontFamily: AppTextStyles.monoFont,
              ),
            ),
            TextSpan(
              text: ' $text',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                fontFamily: AppTextStyles.primaryFont,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildResumeButton(
    VoidCallback onPressed, {
    bool isMobile = false,
  }) {
    return Container(
      decoration: AppDecorations.buttonDecoration,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 16,
            vertical: isMobile ? 6 : 8,
          ),
        ),
        child: Text(
          AppConstants.resumeLabel,
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            fontFamily: AppTextStyles.monoFont,
          ),
        ),
      ),
    );
  }
}
