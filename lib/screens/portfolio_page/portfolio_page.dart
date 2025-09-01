import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:hashini_portfolio/services/email_service.dart';
import 'package:hashini_portfolio/constants/constants.dart';
import 'package:hashini_portfolio/constants/responsive_utils.dart';
import 'package:hashini_portfolio/constants/app_colors.dart';
import 'package:hashini_portfolio/constants/app_styles.dart';
import 'package:hashini_portfolio/data/project_data.dart';
import 'package:hashini_portfolio/screens/projects_page.dart';

import 'widgets/about_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/navigation_header.dart';
import 'widgets/projects_section.dart';
import 'widgets/sidebar.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: AppAnimations.fadeInDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: AppAnimations.scrollDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  void _navigateToAllProjects() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AllProjectsPage(allProjects: ProjectData.allProjects),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: ResponsiveUtils.isMobile(context) ? _buildMobileDrawer() : null,
      body: ResponsiveUtils.isMobile(context)
          ? _buildMobileLayout()
          : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        NavigationHeader.mobile(
          onMenuPressed: () => Scaffold.of(context).openDrawer(),
          onResumePressed: _handleResumePressed,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            HeroSection(
              fadeAnimation: _fadeAnimation,
              onGetInTouchPressed: _showContactDialog,
            ),
            const AboutSection(),
            const ExperienceSection(),
            ProjectsSection(
              featuredProjects: ProjectData.featuredProjects,
              onViewAllPressed: _navigateToAllProjects,
            ),
            ContactSection(onGetInTouchPressed: _showContactDialog),
            _buildMobileFooter(),
          ]),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        if (ResponsiveUtils.isDesktop(context))
          Sidebar.left(onSocialPressed: _launchURL),
        Expanded(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              NavigationHeader.desktop(
                onNavPressed: _scrollToSection,
                onResumePressed: _handleResumePressed,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  HeroSection(
                    fadeAnimation: _fadeAnimation,
                    onGetInTouchPressed: _showContactDialog,
                  ),
                  const AboutSection(),
                  const ExperienceSection(),
                  ProjectsSection(
                    featuredProjects: ProjectData.featuredProjects,
                    onViewAllPressed: _navigateToAllProjects,
                  ),
                  ContactSection(onGetInTouchPressed: _showContactDialog),
                ]),
              ),
            ],
          ),
        ),
        if (ResponsiveUtils.isDesktop(context)) Sidebar.right(),
      ],
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: Column(
        children: [
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: AppDecorations.primaryBorder,
            child: Text(
              AppConstants.appName,
              style: AppTextStyles.logo(context),
            ),
          ),
          const SizedBox(height: 50),
          _buildMobileNavButton(
            AppConstants.aboutNumber,
            AppConstants.aboutLabel,
            () => _scrollToSection(AppScrollOffsets.aboutOffset),
          ),
          _buildMobileNavButton(
            AppConstants.experienceNumber,
            AppConstants.experienceLabel,
            () => _scrollToSection(AppScrollOffsets.experienceOffset),
          ),
          _buildMobileNavButton(
            AppConstants.projectsNumber,
            AppConstants.projectsLabel,
            () => _scrollToSection(AppScrollOffsets.projectsOffset),
          ),
          _buildMobileNavButton(
            AppConstants.contactNumber,
            AppConstants.contactLabel,
            () => _scrollToSection(AppScrollOffsets.contactOffset),
          ),
          const SizedBox(height: 30),
          _buildResumeButton(),
          const Spacer(),
          _buildMobileSocialLinks(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildMobileNavButton(
    String number,
    String text,
    VoidCallback onPressed,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
          onPressed();
        },
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textSecondary,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: number, style: AppTextStyles.navButton(context)),
              TextSpan(
                text: ' $text',
                style: AppTextStyles.navButtonText(
                  context,
                ).copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialIcon(Icons.work, AppConstants.linkedinUrl),
        _buildSocialIcon(Icons.code, AppConstants.githubUrl),
        _buildSocialIcon(Icons.email, AppConstants.mailtoUrl),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            AppConstants.email,
            style: AppTextStyles.caption(
              context,
            ).copyWith(fontFamily: AppTextStyles.monoFont),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.work, AppConstants.linkedinUrl),
              const SizedBox(width: 20),
              _buildSocialIcon(Icons.code, AppConstants.githubUrl),
              const SizedBox(width: 20),
              _buildSocialIcon(Icons.email, AppConstants.mailtoUrl),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return MouseRegion(
      onEnter: (_) => HapticFeedback.lightImpact(),
      child: GestureDetector(
        onTap: () => _launchURL(url),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: AppColors.textSecondary, size: 20),
        ),
      ),
    );
  }

  Widget _buildResumeButton() {
    return Container(
      decoration: AppDecorations.buttonDecoration,
      child: TextButton(
        onPressed: _handleResumePressed,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: ResponsiveUtils.getButtonPadding(context),
        ),
        child: Text(
          AppConstants.resumeLabel,
          style: AppTextStyles.button(context),
        ),
      ),
    );
  }

  void _handleResumePressed() {
    // TODO: Implement resume download logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Resume download will be implemented soon!'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  void _showContactDialog() {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    showDialog(
      context: context,
      barrierColor: AppColors.overlay,
      builder: (context) => Dialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.primary, width: 1),
        ),
        child: Container(
          width: ResponsiveUtils.isMobile(context)
              ? MediaQuery.of(context).size.width * 0.9
              : 500,
          padding: ResponsiveUtils.getCardPadding(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDialogHeader(),
              SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
              _buildDialogTextField('Name', nameController),
              SizedBox(height: ResponsiveUtils.getVerticalSpacing(context) / 2),
              _buildDialogTextField('Email', emailController),
              SizedBox(height: ResponsiveUtils.getVerticalSpacing(context) / 2),
              _buildDialogTextField('Message', messageController, maxLines: 4),
              SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
              _buildSendButton(
                nameController,
                emailController,
                messageController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppConstants.getInTouchLabel,
          style: AppTextStyles.heading3(context),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildDialogTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.caption(context).copyWith(
            color: AppColors.primary,
            fontFamily: AppTextStyles.monoFont,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: AppTextStyles.body(
            context,
          ).copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textSecondary),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textSecondary),
            ),
            filled: true,
            fillColor: AppColors.background,
            hintText: 'Enter your $label...',
            hintStyle: AppTextStyles.body(context),
            contentPadding: ResponsiveUtils.getCardPadding(context) / 2,
          ),
        ),
      ],
    );
  }

  Widget _buildSendButton(
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController messageController,
  ) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: AppDecorations.buttonDecoration,
        child: TextButton(
          onPressed: () =>
              _sendEmail(nameController, emailController, messageController),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            padding: ResponsiveUtils.getButtonPadding(context, isLarge: true),
          ),
          child: Text('Send Message', style: AppTextStyles.button(context)),
        ),
      ),
    );
  }

  Future<void> _sendEmail(
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController messageController,
  ) async {
    debugPrint('Testing EmailJS config...');
    await EmailService.testConfiguration();

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final message = messageController.text.trim();

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
    );

    try {
      final response = await EmailService.sendEmail(
        name: name,
        email: email,
        message: message,
      );

      // Close loading dialog
      Navigator.pop(context);

      if (response.success) {
        // Close contact dialog
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Message sent successfully! I\'ll get back to you soon.',
            ),
            backgroundColor: AppColors.success,
          ),
        );
        // Clear form
        nameController.clear();
        emailController.clear();
        messageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? 'Failed to send message'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } catch (e) {
      // Close loading dialog
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send message: ${e.toString()}'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
