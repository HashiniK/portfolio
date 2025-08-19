import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hashini_portfolio/models/project.dart';
import 'package:hashini_portfolio/screens/projects_page.dart';
import 'package:hashini_portfolio/services/email_service.dart';
import 'package:url_launcher/url_launcher.dart';

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
      duration: const Duration(milliseconds: 1000),
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
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A192F),
      body: Row(
        children: [
          // Left sidebar
          _buildSidebar(),
          // Main content
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                _buildHeader(),
                SliverList(
                  delegate: SliverChildListDelegate([
                    _buildHeroSection(),
                    _buildAboutSection(),
                    _buildExperienceSection(),
                    _buildProjectsSection(),
                    _buildContactSection(),
                  ]),
                ),
              ],
            ),
          ),
          // Right sidebar
          _buildRightSidebar(),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 80,
      color: const Color(0xFF0A192F),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildSocialIcon(Icons.work, 'https://www.linkedin.com/in/hashini-kodithuwakku-4254a51a6/'),
          const SizedBox(height: 20),
          _buildSocialIcon(Icons.code, 'https://github.com/HashiniK'),
          const SizedBox(height: 20),
          _buildSocialIcon(Icons.email, 'mailto:hashini.kodithuwakku22@gmail.com'),
          const SizedBox(height: 20),
          Container(
            width: 1,
            height: 100,
            color: const Color(0xFF64FFDA),
          ),
          const SizedBox(height: 20),
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
          child: Icon(
            icon,
            color: const Color(0xFF8892B0),
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildRightSidebar() {
    return Container(
      width: 80,
      color: const Color(0xFF0A192F),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const RotatedBox(
            quarterTurns: 1,
            child: Text(
              'hashini.kodithuwakku22@gmail.com',
              style: TextStyle(
                color: Color(0xFF8892B0),
                fontSize: 12,
                fontFamily: 'SF Mono',
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 1,
            height: 100,
            color: const Color(0xFF64FFDA),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SliverAppBar(
      expandedHeight: 0,
      floating: true,
      pinned: true,
      backgroundColor: const Color(0xFF0A192F).withOpacity(0.95),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF64FFDA), width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Text(
          'HK',
          style: TextStyle(
            color: Color(0xFF64FFDA),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'SF Mono',
          ),
        ),
      ),
      actions: [
        _buildNavButton('01.', 'About', () => _scrollToSection(600)),
        _buildNavButton('02.', 'Experience', () => _scrollToSection(1200)),
        _buildNavButton('03.', 'Projects', () => _scrollToSection(1800)),
        _buildNavButton('04.', 'Contact', () => _scrollToSection(2800)),
        const SizedBox(width: 20),
        _buildResumeButton(),
        const SizedBox(width: 40),
      ],
    );
  }

  Widget _buildNavButton(String number, String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF8892B0),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: number,
              style: const TextStyle(
                color: Color(0xFF64FFDA),
                fontSize: 12,
                fontFamily: 'SF Mono',
              ),
            ),
            TextSpan(
              text: ' $text',
              style: const TextStyle(
                color: Color(0xFF8892B0),
                fontSize: 14,
                fontFamily: 'Calibre',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResumeButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF64FFDA), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextButton(
        onPressed: () {
          // Add resume download logic
        },
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF64FFDA),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: const Text(
          'Resume',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'SF Mono',
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi, my name is',
              style: TextStyle(
                color: Color(0xFF64FFDA),
                fontSize: 16,
                fontFamily: 'SF Mono',
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Hashini Kodithuwakku.',
              style: TextStyle(
                color: Color(0xFFCCD6F6),
                fontSize: 80,
                fontWeight: FontWeight.w600,
                fontFamily: 'Calibre',
                height: 1.1,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'I build things for the digital world.',
              style: TextStyle(
                color: Color(0xFF8892B0),
                fontSize: 80,
                fontWeight: FontWeight.w600,
                fontFamily: 'Calibre',
                height: 1.1,
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 540,
              child: Text(
                'I\'m a software engineer specializing in building exceptional digital experiences. Currently, I\'m focused on building accessible, human-centered products using Flutter and modern web technologies.',
                style: TextStyle(
                  color: Color(0xFF8892B0),
                  fontSize: 20,
                  height: 1.6,
                  fontFamily: 'Calibre',
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF64FFDA), width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextButton(
                onPressed: _showContactDialog,
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF64FFDA),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                ),
                child: const Text(
                  'Get In Touch',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'SF Mono',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('01.', 'About Me'),
                const SizedBox(height: 40),
                const Text(
                  'Hello! My name is Hashini and I enjoy creating things that live on the internet. My interest in software development started back in 2019 when I decided to try editing custom themes — turns out hacking together HTML & CSS taught me a lot about web development!',
                  style: TextStyle(
                    color: Color(0xFF8892B0),
                    fontSize: 18,
                    height: 1.6,
                    fontFamily: 'Calibre',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Fast-forward to today, and I\'ve had the privilege of working at an innovative startup, building applications for enterprise clients, and contributing to research projects. My main focus these days is building accessible, inclusive products and digital experiences using Flutter and modern web technologies.',
                  style: TextStyle(
                    color: Color(0xFF8892B0),
                    fontSize: 18,
                    height: 1.6,
                    fontFamily: 'Calibre',
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Here are a few technologies I\'ve been working with recently:',
                  style: TextStyle(
                    color: Color(0xFF8892B0),
                    fontSize: 18,
                    fontFamily: 'Calibre',
                  ),
                ),
                const SizedBox(height: 20),
                _buildTechList(),
              ],
            ),
          ),
          const SizedBox(width: 100),
          Expanded(
            flex: 2,
            child: _buildProfileImage(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String number, String title) {
    return Row(
      children: [
        Text(
          number,
          style: const TextStyle(
            color: Color(0xFF64FFDA),
            fontSize: 20,
            fontFamily: 'SF Mono',
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFCCD6F6),
            fontSize: 32,
            fontWeight: FontWeight.w600,
            fontFamily: 'Calibre',
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFF233554),
          ),
        ),
      ],
    );
  }

  Widget _buildTechList() {
    final technologies = [
      'JavaScript (ES6+)',
      'React',
      'Node.js',
      'Flutter',
      'Python',
      'Firebase',
    ];

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: technologies.take(3).map((tech) => _buildTechItem(tech)).toList(),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: technologies.skip(3).map((tech) => _buildTechItem(tech)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTechItem(String tech) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(
            Icons.play_arrow,
            color: Color(0xFF64FFDA),
            size: 14,
          ),
          const SizedBox(width: 10),
          Text(
            tech,
            style: const TextStyle(
              color: Color(0xFF8892B0),
              fontSize: 16,
              fontFamily: 'SF Mono',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 300,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF64FFDA), width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xFF64FFDA).withOpacity(0.1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Color(0xFFE1FFF6),
                  BlendMode.multiply,
                ),
                child: Image(
                  image: AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('02.', 'Where I\'ve Worked'),
          const SizedBox(height: 50),
          _buildExperienceCard(),
        ],
      ),
    );
  }

  Widget _buildExperienceCard() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF64FFDA).withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Software Engineer ',
                  style: TextStyle(
                    color: Color(0xFFCCD6F6),
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Calibre',
                  ),
                ),
                TextSpan(
                  text: '@ XGen Group',
                  style: TextStyle(
                    color: Color(0xFF64FFDA),
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Calibre',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'August 2023 - August 2025',
            style: TextStyle(
              color: Color(0xFF8892B0),
              fontSize: 14,
              fontFamily: 'SF Mono',
            ),
          ),
          const SizedBox(height: 25),
          _buildExperiencePoint('Developed and maintained code for enterprise applications using Flutter, Dart, and modern web technologies'),
          _buildExperiencePoint('Worked with a variety of different languages, platforms, frameworks, and content management systems such as Flutter, React, Node.js, Firebase, and Oracle DB'),
          _buildExperiencePoint('Collaborated with international teams to deliver high-quality software solutions for clients across different time zones'),
          _buildExperiencePoint('Built responsive, accessible user interfaces that work across multiple browsers and devices'),
        ],
      ),
    );
  }

  Widget _buildExperiencePoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(
              Icons.play_arrow,
              color: Color(0xFF64FFDA),
              size: 14,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF8892B0),
                fontSize: 18,
                height: 1.5,
                fontFamily: 'Calibre',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('03.', 'Some Things I\'ve Built'),
          const SizedBox(height: 50),
          ...allProjects.asMap().entries.map((entry) {
            final index = entry.key;
            final project = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: _buildFeaturedProject(project, index % 2 == 0),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildFeaturedProject(Project project, bool imageLeft) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          // Background project image/placeholder
          Positioned(
            left: imageLeft ? 0 : 200,
            right: imageLeft ? 200 : 0,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF64FFDA).withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Icon(
                  Icons.web,
                  color: Color(0xFF64FFDA),
                  size: 80,
                ),
              ),
            ),
          ),
          // Project content
          Positioned(
            left: imageLeft ? 300 : 0,
            right: imageLeft ? 0 : 300,
            top: 50,
            child: Container(
              width: 500,
              child: Column(
                crossAxisAlignment: imageLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Project',
                    style: TextStyle(
                      color: Color(0xFF64FFDA),
                      fontSize: 14,
                      fontFamily: 'SF Mono',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    project.title,
                    style: const TextStyle(
                      color: Color(0xFFCCD6F6),
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Calibre',
                    ),
                    textAlign: imageLeft ? TextAlign.right : TextAlign.left,
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: const Color(0xFF112240),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      project.description,
                      style: const TextStyle(
                        color: Color(0xFF8892B0),
                        fontSize: 18,
                        height: 1.5,
                        fontFamily: 'Calibre',
                      ),
                      textAlign: imageLeft ? TextAlign.right : TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Wrap(
                    alignment: imageLeft ? WrapAlignment.end : WrapAlignment.start,
                    spacing: 20,
                    children: project.technologies.map((tech) => Text(
                      tech,
                      style: const TextStyle(
                        color: Color(0xFF8892B0),
                        fontSize: 14,
                        fontFamily: 'SF Mono',
                      ),
                    )).toList(),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: imageLeft ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add GitHub link
                        },
                        icon: const Icon(
                          Icons.code,
                          color: Color(0xFF8892B0),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Add live demo link
                        },
                        icon: const Icon(
                          Icons.launch,
                          color: Color(0xFF8892B0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      child: Column(
        children: [
          const Text(
            '04. What\'s Next?',
            style: TextStyle(
              color: Color(0xFF64FFDA),
              fontSize: 16,
              fontFamily: 'SF Mono',
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Get In Touch',
            style: TextStyle(
              color: Color(0xFFCCD6F6),
              fontSize: 60,
              fontWeight: FontWeight.w600,
              fontFamily: 'Calibre',
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            width: 600,
            child: Text(
              'Although I\'m not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I\'ll try my best to get back to you!',
              style: TextStyle(
                color: Color(0xFF8892B0),
                fontSize: 20,
                height: 1.5,
                fontFamily: 'Calibre',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF64FFDA), width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextButton(
              onPressed: _showContactDialog,
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF64FFDA),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
              ),
              child: const Text(
                'Say Hello',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SF Mono',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showContactDialog() {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF112240),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFF64FFDA), width: 1),
        ),
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Get In Touch',
                    style: TextStyle(
                      color: Color(0xFFCCD6F6),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Calibre',
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF8892B0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Form fields
              _buildDialogTextField('Name', nameController),
              const SizedBox(height: 20),
              _buildDialogTextField('Email', emailController),
              const SizedBox(height: 20),
              _buildDialogTextField('Message', messageController, maxLines: 4),
              const SizedBox(height: 30),

              // Send button
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF64FFDA), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      await _sendEmailViaEmailJS(nameController, emailController, messageController);
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF64FFDA),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Send Message',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'SF Mono',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF64FFDA),
            fontSize: 14,
            fontFamily: 'SF Mono',
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(
            color: Color(0xFFCCD6F6),
            fontSize: 16,
            fontFamily: 'Calibre',
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF8892B0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF64FFDA), width: 2),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF8892B0)),
            ),
            filled: true,
            fillColor: const Color(0xFF0A192F),
            hintText: 'Enter your $label...',
            hintStyle: const TextStyle(
              color: Color(0xFF8892B0),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _sendEmailViaEmailJS(
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController messageController) async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final message = messageController.text.trim();

    // Validate form
    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final success = await EmailService.sendEmail(
        name: name,
        email: email,
        message: message,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Message sent successfully! I\'ll get back to you soon.'),
            backgroundColor: Colors.green,
          ),
        );

        // Clear form
        nameController.clear();
        emailController.clear();
        messageController.clear();
      } else {
        throw Exception('Failed to send email');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to send message. Please try again.'),
          backgroundColor: Colors.red,
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