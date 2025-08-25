import 'package:flutter/material.dart';

enum ProjectCategory {
  enterpriseTools,
  webApplications,
  mobileApps,
  aiMlResearch,
  businessTools,
  communicationTools,
  analyticsTools;

  String get displayName {
    switch (this) {
      case ProjectCategory.enterpriseTools:
        return 'Enterprise Tools';
      case ProjectCategory.webApplications:
        return 'Web Applications';
      case ProjectCategory.mobileApps:
        return 'Mobile Apps';
      case ProjectCategory.aiMlResearch:
        return 'AI/ML Research';
      case ProjectCategory.businessTools:
        return 'Business Tools';
      case ProjectCategory.communicationTools:
        return 'Communication Tools';
      case ProjectCategory.analyticsTools:
        return 'Analytics Tools';
    }
  }
}

class Project {
  final String title;
  final String subtitle;
  final String description;
  final List<String> technologies;
  final Color accentColor;
  final IconData icon;
  final ProjectCategory category;
  final bool isFeatured;
  final String? clientType;
  final String? duration;
  final String? githubUrl;
  final String? liveUrl;
  final List<String>? images;

  const Project({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.technologies,
    required this.accentColor,
    required this.icon,
    required this.category,
    this.isFeatured = false,
    this.clientType,
    this.duration,
    this.githubUrl,
    this.liveUrl,
    this.images,
  });

  // Helper methods
  bool get hasLinks => githubUrl != null || liveUrl != null;

  bool get hasImages => images != null && images!.isNotEmpty;

  String get categoryDisplayName => category.displayName;

  // Create a copy with updated properties
  Project copyWith({
    String? title,
    String? subtitle,
    String? description,
    List<String>? technologies,
    Color? accentColor,
    IconData? icon,
    ProjectCategory? category,
    bool? isFeatured,
    String? clientType,
    String? duration,
    String? githubUrl,
    String? liveUrl,
    List<String>? images,
  }) {
    return Project(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      technologies: technologies ?? this.technologies,
      accentColor: accentColor ?? this.accentColor,
      icon: icon ?? this.icon,
      category: category ?? this.category,
      isFeatured: isFeatured ?? this.isFeatured,
      clientType: clientType ?? this.clientType,
      duration: duration ?? this.duration,
      githubUrl: githubUrl ?? this.githubUrl,
      liveUrl: liveUrl ?? this.liveUrl,
      images: images ?? this.images,
    );
  }

  // Convert to Map (for JSON serialization if needed)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'technologies': technologies,
      'category': category.name,
      'isFeatured': isFeatured,
      'clientType': clientType,
      'duration': duration,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
      'images': images,
    };
  }

  // Create from Map (for JSON deserialization if needed)
  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      description: map['description'] ?? '',
      technologies: List<String>.from(map['technologies'] ?? []),
      accentColor: Colors.blue,
      // Default color, could be mapped from hex
      icon: Icons.web,
      // Default icon, could be mapped from icon name
      category: ProjectCategory.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => ProjectCategory.webApplications,
      ),
      isFeatured: map['isFeatured'] ?? false,
      clientType: map['clientType'],
      duration: map['duration'],
      githubUrl: map['githubUrl'],
      liveUrl: map['liveUrl'],
      images: map['images'] != null ? List<String>.from(map['images']) : null,
    );
  }

  @override
  String toString() {
    return 'Project{title: $title, category: ${category.displayName}, isFeatured: $isFeatured}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Project &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.description == description;
  }

  @override
  int get hashCode {
    return title.hashCode ^ subtitle.hashCode ^ description.hashCode;
  }
}
