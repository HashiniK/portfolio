class AppConstants {
  // App Info
  static const String appTitle = 'Hashini Kodithuwakku - Portfolio';
  static const String appName = 'HK';
  static const String fullName = 'Hashini Kodithuwakku';
  static const String tagline = 'I build things for the digital world.';
  static const String subtitle = 'Software Engineer';

  // Contact Info
  static const String email = 'hashini.kodithuwakku22@gmail.com';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/hashini-kodithuwakku-4254a51a6/';
  static const String githubUrl = 'https://github.com/HashiniK';
  static const String mailtoUrl = 'mailto:hashini.kodithuwakku22@gmail.com';

  // Navigation Labels
  static const String aboutLabel = 'About';
  static const String experienceLabel = 'Experience';
  static const String projectsLabel = 'Projects';
  static const String contactLabel = 'Contact';
  static const String resumeLabel = 'Resume';

  // Section Numbers
  static const String aboutNumber = '01.';
  static const String experienceNumber = '02.';
  static const String projectsNumber = '03.';
  static const String contactNumber = '04.';

  // Intro Text
  static const String greeting = 'Hi, my name is';
  static const String introDescription =
      'I\'m a software engineer specializing in building exceptional digital experiences. '
      'Currently, I\'m focused on building accessible, human-centered products using Flutter and modern web technologies.';

  // About Section
  static const String aboutTitle = 'About Me';
  static const String aboutDescription1 =
      'Hello! My name is Hashini and I enjoy creating things that live on the internet. '
      'My interest in software development started back in 2019 when I decided to try editing custom themes — '
      'turns out hacking together HTML & CSS taught me a lot about web development!';

  static const String aboutDescription2 =
      'Fast-forward to today, and I\'ve had the privilege of working at an innovative startup, '
      'building applications for enterprise clients, and contributing to research projects. '
      'My main focus these days is building accessible, inclusive products and digital experiences '
      'using Flutter and modern web technologies.';

  static const String techListTitle =
      'Here are a few technologies I\'ve been working with recently:';

  // Experience Section
  static const String experienceTitle = 'Where I\'ve Worked';
  static const String jobTitle = 'Software Engineer';
  static const String company = 'XGen Group';
  static const String jobDuration = 'August 2023 - August 2025';

  // Projects Section
  static const String projectsTitle = 'Some Things I\'ve Built';
  static const String featuredProjectLabel = 'Featured Project';
  static const String viewAllProjectsLabel = 'View All Projects';

  // Contact Section
  static const String contactSectionNumber = '04. What\'s Next?';
  static const String contactTitle = 'Get In Touch';
  static const String contactDescription =
      'Although I\'m not currently looking for any new opportunities, my inbox is always open. '
      'Whether you have a question or just want to say hi, I\'ll try my best to get back to you!';
  static const String sayHelloLabel = 'Say Hello';
  static const String getInTouchLabel = 'Get In Touch';

  // Technologies List
  static const List<String> technologies = [
    'JavaScript (ES6+)',
    'React',
    'Node.js',
    'Flutter',
    'Python',
    'Firebase',
  ];

  // Experience Points
  static const List<String> experiencePoints = [
    'Developed and maintained code for enterprise applications using Flutter, Dart, and modern web technologies',
    'Worked with a variety of different languages, platforms, frameworks, and content management systems such as Flutter, React, Node.js, Firebase, and Oracle DB',
    'Collaborated with international teams to deliver high-quality software solutions for clients across different time zones',
    'Built responsive, accessible user interfaces that work across multiple browsers and devices',
  ];
}

class AppDimensions {
  // Breakpoints
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;

  // Padding
  static const double mobilePadding = 20;
  static const double tabletPadding = 50;
  static const double desktopPadding = 100;

  // Spacing
  static const double smallSpacing = 10;
  static const double mediumSpacing = 20;
  static const double largeSpacing = 30;
  static const double extraLargeSpacing = 50;

  // Sidebar
  static const double sidebarWidth = 80;
  static const double sidebarLineHeight = 100;

  // Profile Image
  static const double mobileProfileImageSize = 250;
  static const double desktopProfileImageSize = 300;
  static const double profileImageOffset = 20;
  static const double mobileProfileImageOffset = 15;

  // Project Card
  static const double projectCardHeight = 400;
  static const double projectCardPadding = 25;
}

class AppTextSizes {
  // Mobile Text Sizes
  static const double mobileH1 = 40;
  static const double mobileH2 = 32;
  static const double mobileH3 = 24;
  static const double mobileBody = 16;
  static const double mobileSmall = 14;
  static const double mobileExtraSmall = 12;

  // Tablet Text Sizes
  static const double tabletH1 = 60;
  static const double tabletH2 = 50;
  static const double tabletH3 = 32;
  static const double tabletBody = 18;
  static const double tabletSmall = 16;

  // Desktop Text Sizes
  static const double desktopH1 = 80;
  static const double desktopH2 = 80;
  static const double desktopH3 = 32;
  static const double desktopBody = 20;
  static const double desktopSmall = 18;

  // Section Numbers
  static const double sectionNumberSize = 20;
  static const double mobileSectionNumberSize = 16;
}

class AppAnimations {
  static const Duration fadeInDuration = Duration(milliseconds: 1000);
  static const Duration scrollDuration = Duration(milliseconds: 800);
  static const Duration buttonHoverDuration = Duration(milliseconds: 200);
}

class AppScrollOffsets {
  static const double aboutOffset = 600;
  static const double experienceOffset = 1200;
  static const double projectsOffset = 1800;
  static const double contactOffset = 2800;
}
