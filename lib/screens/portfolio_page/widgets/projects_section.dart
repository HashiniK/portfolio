import 'package:flutter/material.dart';

import 'package:hashini_portfolio/models/project.dart';
import 'package:hashini_portfolio/constants/constants.dart';
import 'package:hashini_portfolio/constants/app_colors.dart';
import 'package:hashini_portfolio/constants/app_styles.dart';
import 'package:hashini_portfolio/constants/responsive_utils.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> featuredProjects;
  final VoidCallback onViewAllPressed;

  const ProjectsSection({
    super.key,
    required this.featuredProjects,
    required this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ResponsiveUtils.getSectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context),
          SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
          ...featuredProjects.asMap().entries.map((entry) {
            final index = entry.key;
            final project = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                bottom: ResponsiveUtils.getVerticalSpacing(
                  context,
                  isLarge: true,
                ),
              ),
              child: ResponsiveUtils.isMobile(context)
                  ? _buildMobileProject(context, project)
                  : _buildFeaturedProject(context, project, index % 2 == 0),
            );
          }).toList(),
          SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
          _buildViewAllProjectsButton(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          AppConstants.projectsNumber,
          style: AppTextStyles.sectionNumber(context),
        ),
        SizedBox(width: AppDimensions.smallSpacing),
        Text(
          AppConstants.projectsTitle,
          style: AppTextStyles.heading3(context),
        ),
        SizedBox(width: AppDimensions.mediumSpacing),
        Expanded(child: Container(height: 1, color: AppColors.surfaceVariant)),
      ],
    );
  }

  Widget _buildMobileProject(BuildContext context, Project project) {
    return Container(
      padding: ResponsiveUtils.getCardPadding(context),
      decoration: AppDecorations.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.featuredProjectLabel,
            style: AppTextStyles.caption(context).copyWith(
              color: AppColors.primary,
              fontFamily: AppTextStyles.monoFont,
            ),
          ),
          SizedBox(height: AppDimensions.smallSpacing),
          Text(
            project.title,
            style: AppTextStyles.heading3(context).copyWith(fontSize: 20),
          ),
          SizedBox(height: AppDimensions.mediumSpacing),
          _buildProjectImage(context),
          SizedBox(height: AppDimensions.mediumSpacing),
          Text(project.description, style: AppTextStyles.body(context)),
          SizedBox(height: AppDimensions.mediumSpacing),
          _buildTechnologyList(context, project.technologies),
          SizedBox(height: AppDimensions.mediumSpacing),
          _buildProjectLinks(context, project),
        ],
      ),
    );
  }

  Widget _buildFeaturedProject(
    BuildContext context,
    Project project,
    bool imageLeft,
  ) {
    return SizedBox(
      height: AppDimensions.projectCardHeight,
      child: Stack(
        children: [
          // Background project image/placeholder
          Positioned(
            left: imageLeft ? 0 : 200,
            right: imageLeft ? 200 : 0,
            top: 0,
            bottom: 0,
            child: _buildProjectImage(context),
          ),
          // Project content
          Positioned(
            left: imageLeft ? 300 : 0,
            right: imageLeft ? 0 : 300,
            top: 50,
            child: SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: imageLeft
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.featuredProjectLabel,
                    style: AppTextStyles.caption(context).copyWith(
                      color: AppColors.primary,
                      fontFamily: AppTextStyles.monoFont,
                    ),
                  ),
                  SizedBox(height: AppDimensions.smallSpacing),
                  Text(
                    project.title,
                    style: AppTextStyles.heading3(
                      context,
                    ).copyWith(fontSize: 28),
                    textAlign: imageLeft ? TextAlign.right : TextAlign.left,
                  ),
                  SizedBox(height: AppDimensions.largeSpacing),
                  Container(
                    padding: EdgeInsets.all(AppDimensions.projectCardPadding),
                    decoration: AppDecorations.cardDecoration,
                    child: Text(
                      project.description,
                      style: AppTextStyles.bodyLarge(context),
                      textAlign: imageLeft ? TextAlign.right : TextAlign.left,
                    ),
                  ),
                  SizedBox(height: AppDimensions.largeSpacing),
                  Wrap(
                    alignment: imageLeft
                        ? WrapAlignment.end
                        : WrapAlignment.start,
                    spacing: 20,
                    children: project.technologies
                        .map(
                          (tech) => Text(
                            tech,
                            style: AppTextStyles.techItem(context),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: AppDimensions.largeSpacing),
                  _buildProjectLinks(context, project, imageLeft: imageLeft),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceOverlay,
        borderRadius: BorderRadius.circular(4),
      ),
      // child: const Center(
      //   child: Icon(Icons.web, color: AppColors.primary, size: 80),
      // ),
    );
  }

  Widget _buildTechnologyList(BuildContext context, List<String> technologies) {
    return Wrap(
      spacing: 15,
      runSpacing: 10,
      children: technologies
          .map((tech) => Text(tech, style: AppTextStyles.techItem(context)))
          .toList(),
    );
  }

  Widget _buildProjectLinks(
    BuildContext context,
    Project project, {
    bool imageLeft = false,
  }) {
    return Row(
      mainAxisAlignment: imageLeft
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        if (project.githubUrl != null)
          IconButton(
            onPressed: () {
              // TODO: Launch GitHub URL
            },
            icon: const Icon(Icons.code, color: AppColors.textSecondary),
          ),
        if (project.liveUrl != null)
          IconButton(
            onPressed: () {
              // TODO: Launch live demo URL
            },
            icon: const Icon(Icons.launch, color: AppColors.textSecondary),
          ),
      ],
    );
  }

  Widget _buildViewAllProjectsButton(BuildContext context) {
    return Center(
      child: Container(
        decoration: AppDecorations.buttonDecoration,
        child: TextButton(
          onPressed: onViewAllPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            padding: ResponsiveUtils.getButtonPadding(context, isLarge: true),
          ),
          child: Text(
            AppConstants.viewAllProjectsLabel,
            style: AppTextStyles.button(context),
          ),
        ),
      ),
    );
  }
}
