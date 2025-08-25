import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/app_styles.dart';
import '../../../constants/responsive_utils.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ResponsiveUtils.getSectionPadding(context),
      child: ResponsiveUtils.isMobile(context)
          ? _buildMobileAbout(context)
          : _buildDesktopAbout(context),
    );
  }

  Widget _buildMobileAbout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context),
        SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
        // _buildProfileImage(context),
        SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
        _buildAboutContent(context),
      ],
    );
  }

  Widget _buildDesktopAbout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle(context),
              SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
              _buildAboutContent(context),
            ],
          ),
        ),
        const SizedBox(width: 100),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Row(
      children: [
        Text(
          AppConstants.aboutNumber,
          style: AppTextStyles.sectionNumber(context),
        ),
        SizedBox(width: AppDimensions.smallSpacing),
        Text(AppConstants.aboutTitle, style: AppTextStyles.heading3(context)),
        SizedBox(width: AppDimensions.mediumSpacing),
        Expanded(child: Container(height: 1, color: AppColors.surfaceVariant)),
      ],
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.aboutDescription1,
          style: AppTextStyles.body(context),
        ),
        SizedBox(height: AppDimensions.mediumSpacing),
        Text(
          AppConstants.aboutDescription2,
          style: AppTextStyles.body(context),
        ),
        SizedBox(height: AppDimensions.largeSpacing),
        Text(AppConstants.techListTitle, style: AppTextStyles.body(context)),
        SizedBox(height: AppDimensions.mediumSpacing),
        _buildTechList(context),
      ],
    );
  }

  Widget _buildTechList(BuildContext context) {
    if (ResponsiveUtils.isMobile(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: AppConstants.technologies
            .map((tech) => _buildTechItem(context, tech))
            .toList(),
      );
    }

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AppConstants.technologies
                .take(3)
                .map((tech) => _buildTechItem(context, tech))
                .toList(),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AppConstants.technologies
                .skip(3)
                .map((tech) => _buildTechItem(context, tech))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTechItem(BuildContext context, String tech) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.smallSpacing),
      child: Row(
        children: [
          const Icon(Icons.play_arrow, color: AppColors.primary, size: 14),
          SizedBox(width: AppDimensions.smallSpacing),
          Text(tech, style: AppTextStyles.techItem(context)),
        ],
      ),
    );
  }

}
