class CategoryModel {
  final String id;
  final String categoryImageUrl;
  final String categoryName;
  final int version;
  final DateTime updatedAt;

  CategoryModel({
    required this.id,
    required this.categoryImageUrl,
    required this.categoryName,
    required this.version,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      categoryImageUrl: json['category_imageUrl'],
      categoryName: json['category_name'],
      version: json['__v'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'category_imageUrl': categoryImageUrl,
      'category_name': categoryName,
      '__v': version,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
