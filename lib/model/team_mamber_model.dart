class TeamMemberModel {
  final String name;
  final String title;
  final String imageUrl;

  TeamMemberModel({
    required this.name,
    required this.title,
    required this.imageUrl,
  });

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    String img = json['imageUrl'] ?? '';
    if (img.trim().isEmpty) {
      img =
          'https://i.pinimg.com/originals/6e/59/95/6e599501252c23bcf02658617b29c894.jpg';
    }
    return TeamMemberModel(
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      imageUrl: img,
    );
  }
}
