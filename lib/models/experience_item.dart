class ExperienceItem {
  final String role;
  final String company;
  final String duration;
  final String location;
  final bool isCurrent;
  final List<String> points;
  final List<String> keyProjects;

  ExperienceItem({
    required this.role,
    required this.company,
    required this.duration,
    required this.location,
    required this.isCurrent,
    required this.points,
    required this.keyProjects,
  });
}