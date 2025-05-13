class UserDataModel {
  final String? sId;
  final String? name;
  final String? username;
  final String? email;
  final String? password;
  final String? role;
  final String? imageUrl;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;

  UserDataModel(
      {this.sId,
      this.name,
      this.username,
      this.email,
      this.password,
      this.role,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.iV});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    String img = json["imageUrl"] ?? '';
    if (img.trim().isEmpty) {
      img =
          'https://i.pinimg.com/originals/6e/59/95/6e599501252c23bcf02658617b29c894.jpg';
    }
    return UserDataModel(
      sId: json['_id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      imageUrl: img,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    data["imageUrl"] = this.imageUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
