import 'package:flutter/material.dart';
import 'package:hashini_portfolio/models/project.dart';
import 'package:hashini_portfolio/data/project_data.dart';
import 'package:hashini_portfolio/constants/constants.dart';
import 'package:hashini_portfolio/constants/app_colors.dart';
import 'package:hashini_portfolio/constants/app_styles.dart';
import 'package:hashini_portfolio/constants/responsive_utils.dart';

class AllProjectsPage extends StatefulWidget {
  final List<Project> allProjects;

  const AllProjectsPage({super.key, required this.allProjects});

  @override
  State<AllProjectsPage> createState() => _AllProjectsPageState();
}

class _AllProjectsPageState extends State<AllProjectsPage>
    with TickerProviderStateMixin {
  String selectedCategory = 'All';
  List<String> categories = [];
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    categories = ProjectData.getCategoryDisplayNames();

    _fadeController = AnimationController(
      duration: AppAnimations.fadeInDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  List<Project> get filteredProjects {
    if (selectedCategory == 'All') {
      return widget.allProjects;
    }
    return widget.allProjects
        .where((p) => p.category.displayName == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate([
              FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    _buildProjectsHeader(context),
                    _buildCategoryFilter(context),
                    _buildProjectsGrid(context),
                    _buildProjectsFooter(context),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 0,
      floating: true,
      pinned: true,
      backgroundColor: AppColors.background.withOpacity(0.95),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        onPressed: () => Navigator.pop(context),
      ),
      title: Container(
        padding: const EdgeInsets.all(8),
        decoration: AppDecorations.primaryBorder,
        child: Text(
          AppConstants.appName,
          style: AppTextStyles.logo(context),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.folder_outlined,
                color: AppColors.primary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                'All Projects',
                style: AppTextStyles.caption(context).copyWith(
                  color: AppColors.primary,
                  fontFamily: AppTextStyles.monoFont,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsHeader(BuildContext context) {
    return Container(
      padding: ResponsiveUtils.getSectionPadding(context),
      child: Column(
        children: [
          // Main header section with glitch effect
          Container(
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveUtils.getVerticalSpacing(context, isLarge: true),
            ),
            child: Column(
              children: [
                // Animated title
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primary.withOpacity(0.7),
                      AppColors.textPrimary,
                    ],
                  ).createShader(bounds),
                  child: Text(
                    'Project Archive',
                    style: AppTextStyles.heading1(context).copyWith(
                      fontSize: ResponsiveUtils.isMobile(context) ? 36 : 48,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: AppDimensions.mediumSpacing),

                // Subtitle with typewriter effect feel
                Text(
                  'A comprehensive collection of digital experiences',
                  style: AppTextStyles.body(context).copyWith(
                    fontSize: ResponsiveUtils.isMobile(context) ? 16 : 20,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: AppDimensions.extraLargeSpacing),

                // Stats row with glowing effect
                ResponsiveUtils.isMobile(context)
                    ? _buildMobileStats(context)
                    : _buildDesktopStats(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileStats(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard('${widget.allProjects.length}', 'Projects'),
            _buildStatCard('${categories.length - 1}', 'Categories'),
          ],
        ),
        SizedBox(height: AppDimensions.mediumSpacing),
        _buildStatCard('3+', 'Years Experience'),
      ],
    );
  }

  Widget _buildDesktopStats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatCard('${widget.allProjects.length}', 'Total Projects'),
        SizedBox(width: ResponsiveUtils.getHorizontalPadding(context)),
        _buildStatCard('${categories.length - 1}', 'Categories'),
        SizedBox(width: ResponsiveUtils.getHorizontalPadding(context)),
        _buildStatCard('3+', 'Years Experience'),
      ],
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
            ).createShader(bounds),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: AppTextStyles.monoFont,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.caption(context).copyWith(
              letterSpacing: 1,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getHorizontalPadding(context),
        vertical: ResponsiveUtils.getVerticalSpacing(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '02.',
                style: AppTextStyles.sectionNumber(context),
              ),
              SizedBox(width: AppDimensions.smallSpacing),
              Text(
                'Filter Projects',
                style: AppTextStyles.heading3(context).copyWith(fontSize: 24),
              ),
              SizedBox(width: AppDimensions.mediumSpacing),
              Expanded(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.surfaceVariant,
                        AppColors.surfaceVariant.withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.largeSpacing),

          // Category buttons with hover effects
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: categories.map((category) {
              final isSelected = category == selectedCategory;
              return AnimatedContainer(
                duration: AppAnimations.buttonHoverDuration,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.surface,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.primary.withOpacity(0.3),
                        width: 1,
                      ),
                      boxShadow: isSelected ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ] : null,
                    ),
                    child: Text(
                      category,
                      style: AppTextStyles.caption(context).copyWith(
                        color: isSelected
                            ? AppColors.background
                            : AppColors.textSecondary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        fontFamily: AppTextStyles.monoFont,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    final crossAxisCount = ResponsiveUtils.getGridCrossAxisCount(context);
    final spacing = ResponsiveUtils.getGridSpacing(context);

    return Container(
      padding: ResponsiveUtils.getSectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Row(
            children: [
              Text(
                '03.',
                style: AppTextStyles.sectionNumber(context),
              ),
              SizedBox(width: AppDimensions.smallSpacing),
              Text(
                selectedCategory == 'All'
                    ? 'All Projects (${filteredProjects.length})'
                    : '$selectedCategory (${filteredProjects.length})',
                style: AppTextStyles.heading3(context).copyWith(fontSize: 24),
              ),
              SizedBox(width: AppDimensions.mediumSpacing),
              Expanded(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.surfaceVariant,
                        AppColors.surfaceVariant.withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppDimensions.extraLargeSpacing),

          // Projects grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
              childAspectRatio: ResponsiveUtils.isMobile(context) ? 1.1 : 0.85,
            ),
            itemCount: filteredProjects.length,
            itemBuilder: (context, index) {
              final project = filteredProjects[index];
              return _buildProjectCard(context, project, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Project project, int index) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primary.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.background.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with title and featured badge
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.title,
                              style: AppTextStyles.heading3(context).copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              project.subtitle,
                              style: AppTextStyles.caption(context).copyWith(
                                color: AppColors.primary,
                                fontFamily: AppTextStyles.monoFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (project.isFeatured)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Featured',
                            style: AppTextStyles.caption(context).copyWith(
                              color: AppColors.background,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppTextStyles.monoFont,
                            ),
                          ),
                        ),
                    ],
                  ),

                  SizedBox(height: AppDimensions.mediumSpacing),

                  // Project metadata
                  if (project.clientType != null || project.duration != null) ...[
                    Row(
                      children: [
                        if (project.clientType != null) ...[
                          Icon(
                            Icons.business_outlined,
                            color: AppColors.textSecondary,
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            project.clientType!,
                            style: AppTextStyles.caption(context).copyWith(
                              fontSize: 11,
                              fontFamily: AppTextStyles.monoFont,
                            ),
                          ),
                        ],
                        if (project.clientType != null && project.duration != null)
                          Text(
                            ' • ',
                            style: AppTextStyles.caption(context).copyWith(fontSize: 11),
                          ),
                        if (project.duration != null) ...[
                          Icon(
                            Icons.schedule_outlined,
                            color: AppColors.textSecondary,
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            project.duration!,
                            style: AppTextStyles.caption(context).copyWith(
                              fontSize: 11,
                              fontFamily: AppTextStyles.monoFont,
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: AppDimensions.mediumSpacing),
                  ],

                  // Description
                  Expanded(
                    child: Text(
                      project.description,
                      style: AppTextStyles.body(context).copyWith(fontSize: 14),
                      maxLines: ResponsiveUtils.isMobile(context) ? 6 : 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(height: AppDimensions.mediumSpacing),

                  // Technologies
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: project.technologies.take(4).map((tech) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.3),
                          width: 0.5,
                        ),
                      ),
                      child: Text(
                        tech,
                        style: AppTextStyles.caption(context).copyWith(
                          fontSize: 10,
                          color: AppColors.primary,
                          fontFamily: AppTextStyles.monoFont,
                        ),
                      ),
                    )).toList(),
                  ),

                  if (project.technologies.length > 4)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '+${project.technologies.length - 4} more technologies',
                        style: AppTextStyles.caption(context).copyWith(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textSecondary.withOpacity(0.7),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProjectsFooter(BuildContext context) {
    return Container(
      padding: ResponsiveUtils.getSectionPadding(context),
      child: Center(
        child: Column(
          children: [
            Text(
              'Ready to build something amazing?',
              style: AppTextStyles.heading3(context).copyWith(
                fontSize: ResponsiveUtils.isMobile(context) ? 24 : 32,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.mediumSpacing),
            SizedBox(
              width: ResponsiveUtils.isMobile(context) ? double.infinity : 600,
              child: Text(
                'Let\'s collaborate and create exceptional digital experiences together.',
                style: AppTextStyles.body(context),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: AppDimensions.extraLargeSpacing),
            Container(
              decoration: AppDecorations.buttonDecoration,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: ResponsiveUtils.getButtonPadding(context, isLarge: true),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_back, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      'Back to Portfolio',
                      style: AppTextStyles.button(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}