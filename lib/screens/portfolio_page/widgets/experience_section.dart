import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/app_styles.dart';
import '../../../constants/responsive_utils.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ResponsiveUtils.getSectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context),
          SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
          _buildExperienceCard(context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Row(
      children: [
        Text(
          AppConstants.experienceNumber,
          style: AppTextStyles.sectionNumber(context),
        ),
        SizedBox(width: AppDimensions.smallSpacing),
        Text(
          AppConstants.experienceTitle,
          style: AppTextStyles.heading3(context),
        ),
        SizedBox(width: AppDimensions.mediumSpacing),
        Expanded(child: Container(height: 1, color: AppColors.surfaceVariant)),
      ],
    );
  }

  Widget _buildExperienceCard(BuildContext context) {
    return Container(
      padding: ResponsiveUtils.getCardPadding(context),
      decoration: AppDecorations.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveUtils.isMobile(context)
              ? _buildMobileExperienceHeader(context)
              : _buildDesktopExperienceHeader(context),
          SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
          ...AppConstants.experiencePoints
              .map((point) => _buildExperiencePoint(context, point))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildMobileExperienceHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.jobTitle,
          style: AppTextStyles.heading3(context).copyWith(fontSize: 18),
        ),
        Text(
          '@ ${AppConstants.company}',
          style: AppTextStyles.heading3(
            context,
          ).copyWith(fontSize: 18, color: AppColors.primary),
        ),
        SizedBox(height: AppDimensions.smallSpacing),
        Text(
          AppConstants.jobDuration,
          style: AppTextStyles.caption(
            context,
          ).copyWith(fontFamily: AppTextStyles.monoFont),
        ),
      ],
    );
  }

  Widget _buildDesktopExperienceHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${AppConstants.jobTitle} ',
                style: AppTextStyles.heading3(context).copyWith(fontSize: 22),
              ),
              TextSpan(
                text: '@ ${AppConstants.company}',
                style: AppTextStyles.heading3(
                  context,
                ).copyWith(fontSize: 22, color: AppColors.primary),
              ),
            ],
          ),
        ),
        SizedBox(height: AppDimensions.smallSpacing),
        Text(
          AppConstants.jobDuration,
          style: AppTextStyles.caption(
            context,
          ).copyWith(fontFamily: AppTextStyles.monoFont),
        ),
      ],
    );
  }

  Widget _buildExperiencePoint(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.mediumSpacing),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.play_arrow, color: AppColors.primary, size: 14),
          ),
          SizedBox(width: AppDimensions.mediumSpacing),
          Expanded(child: Text(text, style: AppTextStyles.body(context))),
        ],
      ),
    );
  }
}
