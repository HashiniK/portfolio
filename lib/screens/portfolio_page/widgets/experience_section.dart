import 'package:flutter/material.dart';

import 'package:hashini_portfolio/constants/constants.dart';
import 'package:hashini_portfolio/constants/app_styles.dart';
import 'package:hashini_portfolio/constants/app_colors.dart';
import 'package:hashini_portfolio/models/experience_item.dart';
import 'package:hashini_portfolio/constants/responsive_utils.dart';

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
          _buildExperienceTimeline(context),
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

  Widget _buildExperienceTimeline(BuildContext context) {
    final experiences = _getExperienceData();

    return ResponsiveUtils.isMobile(context)
        ? _buildMobileTimeline(context, experiences)
        : _buildDesktopTimeline(context, experiences);
  }

  Widget _buildMobileTimeline(BuildContext context, List<ExperienceItem> experiences) {
    return Column(
      children: experiences
          .asMap()
          .entries
          .map((entry) => _buildMobileTimelineItem(
          context, entry.value, entry.key == experiences.length - 1))
          .toList(),
    );
  }

  Widget _buildDesktopTimeline(BuildContext context, List<ExperienceItem> experiences) {
    return Column(
      children: experiences
          .asMap()
          .entries
          .map((entry) => _buildDesktopTimelineItem(
          context, entry.value, entry.key, experiences.length))
          .toList(),
    );
  }

  Widget _buildDesktopTimelineItem(BuildContext context, ExperienceItem experience,
      int index, int totalItems) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot and line
          Column(
            children: [
              SizedBox(height: 24), // Align with card content start
              _buildTimelineDot(context, experience.isCurrent),
              if (index < totalItems - 1)
                Container(
                  width: 2,
                  height: 80, // Fixed height for consistent spacing
                  margin: EdgeInsets.symmetric(vertical: AppDimensions.mediumSpacing),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primary.withOpacity(0.8),
                        AppColors.primary.withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: AppDimensions.mediumSpacing),
          // Experience card
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: AppDimensions.largeSpacing),
              child: _buildExperienceCard(context, experience, false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTimelineItem(BuildContext context, ExperienceItem experience, bool isLast) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline dot and line
        Column(
          children: [
            SizedBox(height: 24), // Align with card header
            _buildTimelineDot(context, experience.isCurrent),
            if (!isLast)
              Container(
                width: 2,
                height: 150, // Increased height for better visual connection
                margin: EdgeInsets.symmetric(vertical: AppDimensions.mediumSpacing),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary.withOpacity(0.8),
                      AppColors.primary.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
          ],
        ),
        SizedBox(width: AppDimensions.mediumSpacing),
        // Experience card
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: AppDimensions.largeSpacing),
            child: _buildExperienceCard(context, experience, true),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopExperienceCard(BuildContext context, ExperienceItem experience) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDimensions.largeSpacing),
      child: _buildExperienceCard(context, experience, false),
    );
  }

  Widget _buildTimelineDot(BuildContext context, bool isCurrent) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrent ? AppColors.primary : AppColors.surfaceVariant,
        border: Border.all(
          color: AppColors.primary,
          width: isCurrent ? 3 : 2,
        ),
        boxShadow: isCurrent ? [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ] : null,
      ),
      child: isCurrent
          ? Icon(
        Icons.work,
        size: 8,
        color: Colors.white,
      )
          : null,
    );
  }

  Widget _buildTimelineLine(BuildContext context) {
    return Container(
      width: 2,
      height: 60,
      margin: EdgeInsets.symmetric(vertical: AppDimensions.smallSpacing),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary.withOpacity(0.8),
            AppColors.primary.withOpacity(0.3),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, ExperienceItem experience, bool isMobile) {
    return Container(
      padding: ResponsiveUtils.getCardPadding(context),
      decoration: AppDecorations.cardDecoration.copyWith(
        border: experience.isCurrent
            ? Border.all(color: AppColors.primary.withOpacity(0.3), width: 1)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with role and company
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.role,
                      style: AppTextStyles.heading3(context).copyWith(
                        fontSize: isMobile ? 18 : 22,
                        color: experience.isCurrent ? AppColors.primary : null,
                      ),
                    ),
                    Text(
                      '@ ${experience.company}',
                      style: AppTextStyles.heading3(context).copyWith(
                        fontSize: isMobile ? 16 : 20,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (experience.isCurrent)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.smallSpacing,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    'Current',
                    style: AppTextStyles.caption(context).copyWith(
                      color: AppColors.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: AppDimensions.smallSpacing),

          // Duration
          Text(
            experience.duration,
            style: AppTextStyles.caption(context).copyWith(
              fontFamily: AppTextStyles.monoFont,
              color: AppColors.primary.withOpacity(0.8),
            ),
          ),

          if (experience.location.isNotEmpty) ...[
            SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: AppColors.surfaceVariant,
                ),
                SizedBox(width: 4),
                Text(
                  experience.location,
                  style: AppTextStyles.caption(context).copyWith(
                    fontFamily: AppTextStyles.monoFont,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],

          SizedBox(height: AppDimensions.mediumSpacing),

          // Description points
          ...experience.points.map((point) => _buildExperiencePoint(context, point)).toList(),

          // Key projects section
          if (experience.keyProjects.isNotEmpty) ...[
            SizedBox(height: AppDimensions.mediumSpacing),
            Text(
              'Key Projects:',
              style: AppTextStyles.body(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: AppDimensions.smallSpacing),
            ...experience.keyProjects.map((project) =>
                _buildProjectItem(context, project)).toList(),
          ],
        ],
      ),
    );
  }

  Widget _buildExperiencePoint(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.smallSpacing),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(
              Icons.play_arrow,
              color: AppColors.primary,
              size: 14,
            ),
          ),
          SizedBox(width: AppDimensions.smallSpacing),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectItem(BuildContext context, String project) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(width: AppDimensions.smallSpacing),
          Expanded(
            child: Text(
              project,
              style: AppTextStyles.body(context).copyWith(
                fontSize: ResponsiveUtils.isMobile(context) ? 14 : 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ExperienceItem> _getExperienceData() {
    return [
      ExperienceItem(
        role: 'Software Engineer',
        company: 'XGen Group (Pvt.) Ltd.',
        duration: 'August 2024 - Present',
        location: 'Colombo, Sri Lanka',
        isCurrent: true,
        points: [
          'Building scalable web and Android applications using Flutter and Dart with focus on responsive UI and clean architecture',
          'Delivered domestic and international projects on tight deadlines, contributing across UI/UX, API integration, Firebase, and testing',
          'Worked cross-functionally to translate business needs into technical solutions, improving product usability and delivery timelines',
          'Mentoring junior developers and conducting code reviews to maintain high code quality standards',
        ],
        keyProjects: [
          'Workflow Manager – Task automation platform improving team efficiency',
          'Communication Composer – Tool for managing dynamic client communications',
          'Strategy Builder – Interface for creating business logic and decision trees',
          'SmartPortal – Dashboard for user access, analytics, and service management',
        ],
      ),
      ExperienceItem(
        role: 'Associate Software Engineer',
        company: 'XGen Group (Pvt.) Ltd.',
        duration: 'August 2023 - August 2024',
        location: 'Colombo, Sri Lanka',
        isCurrent: false,
        points: [
          'Built dynamic form-driven applications using Flutter and Dart, focusing on metadata-based automation',
          'Developed scalable architecture with reusable components for enterprise-level applications',
          'Collaborated with international clients to understand requirements and deliver customized solutions',
          'Implemented automated testing strategies to ensure code reliability and performance',
        ],
        keyProjects: [
          'Form Builder – JSON-driven platform enabling dynamic form creation',
          'Rule Builder – No-code tools for logic creation and dynamic form generation',
          'Microservice Dashboard – Real-time service health monitor with severity filters',
        ],
      ),
      ExperienceItem(
        role: 'Software Engineering Intern',
        company: 'XGen Group (Pvt.) Ltd.',
        duration: 'January 2021 - July 2022',
        location: 'Colombo, Sri Lanka',
        isCurrent: false,
        points: [
          'Contributed to design, development, and deployment of multiple Android mobile applications using Flutter, Dart, and Firebase',
          'Gained hands-on experience in building UI components, integrating third-party APIs, and handling authentication',
          'Participated in code reviews, QA testing, and user acceptance testing to ensure delivery of high-quality applications',
          'Learned agile development methodologies and worked effectively in cross-functional teams',
        ],
        keyProjects: [
          'ArtGalaxy – Marketplace app for Australian artists to showcase and sell artwork',
          'RoloDex – Contact management system for businesses',
          'SmartCollect – Mobile solution for RDB Bank agents with offline support',
        ],
      ),
    ];
  }
}
