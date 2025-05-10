class TeamMember {
  final String name;
  final String title;
  final String image;

  TeamMember({
    required this.name,
    required this.title,
    required this.image,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
