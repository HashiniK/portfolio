import 'package:flutter/material.dart';

import '../models/project.dart';

class ProjectData {
  // Featured Projects (shown on home page)
  static final List<Project> featuredProjects = [
    Project(
      title: 'Form Builder Platform',
      subtitle: 'JSON-driven dynamic form creation tool',
      description:
          'A metadata-based platform enabling dynamic form creation and automated application generation. Used by international clients to accelerate onboarding and support no-code solutions.',
      technologies: ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'JSON'],
      accentColor: Colors.purple,
      icon: Icons.build_circle_outlined,
      category: ProjectCategory.enterpriseTools,
      isFeatured: true,
      clientType: 'International',
      duration: '8 months',
    ),
    Project(
      title: 'Workflow Manager',
      subtitle: 'Task automation platform',
      description:
          'A comprehensive task automation platform that improves team efficiency through streamlined workflow management and real-time collaboration features.',
      technologies: ['Flutter', 'WebSockets', 'Redis', 'Oracle DB'],
      accentColor: Colors.blue,
      icon: Icons.dashboard_outlined,
      category: ProjectCategory.enterpriseTools,
      isFeatured: true,
      clientType: 'Enterprise',
      duration: '6 months',
    ),
    Project(
      title: 'BiasBlocker',
      subtitle: 'AI-powered hate speech detection',
      description:
          'Final year research project: Hate speech detection tool for Sinhala-English code-mixed text using pre-trained transformers and custom transliteration interface.',
      technologies: ['Python', 'Machine Learning', 'NLP', 'Transformers'],
      accentColor: Colors.orange,
      icon: Icons.psychology_outlined,
      category: ProjectCategory.aiMlResearch,
      isFeatured: true,
      clientType: 'Research',
      duration: '12 months',
    ),
  ];

  // All Projects (including featured)
  static final List<Project> allProjects = [
    // Featured Projects
    ...featuredProjects,

    // Additional Web Applications
    Project(
      title: 'ShelfShare',
      subtitle: 'Online book sharing platform',
      description:
          'A MERN stack application for book borrowing and sharing with role-based access, lending approvals, and automated reminder notifications.',
      technologies: ['React', 'Node.js', 'MongoDB', 'JWT'],
      accentColor: Colors.green,
      icon: Icons.library_books_outlined,
      category: ProjectCategory.webApplications,
      clientType: 'Academic',
      duration: '4 months',
    ),

    // Additional Professional Projects
    Project(
      title: 'Microservice Dashboard',
      subtitle: 'Real-time service health monitor',
      description:
          'A comprehensive dashboard for monitoring microservice health with real-time metrics, severity filters, and automated alerting system. Features interactive charts and customizable monitoring thresholds.',
      technologies: ['Flutter', 'WebSockets', 'Redis', 'Docker', 'Grafana'],
      accentColor: Colors.indigo,
      icon: Icons.monitor_heart_outlined,
      category: ProjectCategory.enterpriseTools,
      clientType: 'Enterprise',
      duration: '5 months',
    ),
    Project(
      title: 'SmartPortal',
      subtitle: 'User access & analytics dashboard',
      description:
          'Centralized portal for user access management, analytics visualization, and service administration. Includes role-based permissions and comprehensive reporting.',
      technologies: ['Flutter', 'Firebase', 'Analytics', 'Charts'],
      accentColor: Colors.teal,
      icon: Icons.dashboard_customize_outlined,
      category: ProjectCategory.enterpriseTools,
      clientType: 'International',
      duration: '7 months',
    ),
    Project(
      title: 'Communication Composer',
      subtitle: 'Dynamic client communication tool',
      description:
          'Advanced tool for managing dynamic client communications with template system, automated messaging, and multi-channel delivery support.',
      technologies: ['Flutter', 'REST APIs', 'Firebase', 'Push Notifications'],
      accentColor: Colors.deepOrange,
      icon: Icons.chat_bubble_outline,
      category: ProjectCategory.communicationTools,
      clientType: 'Enterprise',
      duration: '4 months',
    ),
    Project(
      title: 'Strategy Builder',
      subtitle: 'Business logic & decision trees',
      description:
          'Visual interface for creating complex business logic flows and decision trees. Enables non-technical users to build sophisticated business rules.',
      technologies: [
        'Flutter',
        'JSON Schema',
        'State Management',
        'Algorithms',
      ],
      accentColor: Colors.brown,
      icon: Icons.account_tree_outlined,
      category: ProjectCategory.businessTools,
      clientType: 'Enterprise',
      duration: '6 months',
    ),
    Project(
      title: 'Rule Builder',
      subtitle: 'No-code logic creation platform',
      description:
          'Intuitive drag-and-drop interface for building complex business rules without coding. Features visual rule validation and testing capabilities.',
      technologies: ['Flutter', 'Drag & Drop UI', 'Rule Engine', 'Validation'],
      accentColor: Colors.cyan,
      icon: Icons.rule_outlined,
      category: ProjectCategory.businessTools,
      clientType: 'International',
      duration: '5 months',
    ),
    Project(
      title: 'Segment Manager',
      subtitle: 'Customer segmentation tool',
      description:
          'Advanced customer segmentation platform with machine learning-powered insights, behavioral analysis, and automated segment updates.',
      technologies: ['Flutter', 'ML Models', 'Analytics', 'Data Visualization'],
      accentColor: Colors.pink,
      icon: Icons.group_outlined,
      category: ProjectCategory.analyticsTools,
      clientType: 'Enterprise',
      duration: '4 months',
    ),

    // Mobile Applications
    Project(
      title: 'ArtGalaxy',
      subtitle: 'Australian artist marketplace',
      description:
          'Mobile marketplace app for Australian artists to showcase and sell artwork. Features artist profiles, artwork galleries, secure payments, and buyer-seller messaging.',
      technologies: [
        'Flutter',
        'Firebase',
        'Payment Integration',
        'Image Processing',
      ],
      accentColor: Colors.amber,
      icon: Icons.palette_outlined,
      category: ProjectCategory.mobileApps,
      clientType: 'International',
      duration: '6 months',
    ),
    Project(
      title: 'SmartCollect',
      subtitle: 'RDB Bank collection management',
      description:
          'Mobile solution for RDB Bank agents to manage and record collections with offline support, real-time synchronization, and comprehensive reporting.',
      technologies: [
        'Flutter',
        'Firebase',
        'Offline Storage',
        'Real-time Sync',
      ],
      accentColor: Colors.lightGreen,
      icon: Icons.account_balance_outlined,
      category: ProjectCategory.mobileApps,
      clientType: 'Banking',
      duration: '5 months',
    ),
    Project(
      title: 'RoloDex',
      subtitle: 'Business contact management',
      description:
          'Comprehensive contact management system for businesses with advanced search, categorization, communication history, and integration capabilities.',
      technologies: ['Flutter', 'SQLite', 'Contact APIs', 'Export/Import'],
      accentColor: Colors.blueGrey,
      icon: Icons.contacts_outlined,
      category: ProjectCategory.mobileApps,
      clientType: 'Business',
      duration: '3 months',
    ),
    Project(
      title: 'Seafarer Registration App',
      subtitle: 'Maritime worker registration',
      description:
          'Freelance project for seafarer registration and certification management with document upload, verification workflows, and compliance tracking.',
      technologies: ['Flutter', 'Document Management', 'APIs', 'Validation'],
      accentColor: Colors.lightBlue,
      icon: Icons.sailing_outlined,
      category: ProjectCategory.mobileApps,
      clientType: 'Freelance',
      duration: '2 months',
    ),

    // Academic & Research Projects
    Project(
      title: 'Customer Churn Prediction',
      subtitle: 'Telecom analytics system',
      description:
          'Applied Logistic Regression to predict customer churn behavior in telecom using statistical analysis, feature engineering, and model validation.',
      technologies: [
        'Python',
        'Scikit-learn',
        'Pandas',
        'Statistical Analysis',
      ],
      accentColor: Colors.deepPurple,
      icon: Icons.analytics_outlined,
      category: ProjectCategory.aiMlResearch,
      clientType: 'Academic',
      duration: '3 months',
    ),
    Project(
      title: 'Next Best Offer Recommendation',
      subtitle: 'Personalized telco offers',
      description:
          'Developed a personalized recommendation system for telecom offers with React frontend, Flask backend, and Firebase integration for user data management.',
      technologies: ['Python', 'Flask', 'React', 'Firebase', 'ML Algorithms'],
      accentColor: Colors.red,
      icon: Icons.recommend_outlined,
      category: ProjectCategory.aiMlResearch,
      clientType: 'Academic',
      duration: '4 months',
    ),
  ];

  // Get projects by category
  static List<Project> getProjectsByCategory(ProjectCategory category) {
    return allProjects
        .where((project) => project.category == category)
        .toList();
  }

  // Get all categories
  static List<ProjectCategory> getAllCategories() {
    return ProjectCategory.values;
  }

  // Get category display names
  static List<String> getCategoryDisplayNames() {
    return [
      'All',
      ...ProjectCategory.values.map((category) => category.displayName),
    ];
  }
}
