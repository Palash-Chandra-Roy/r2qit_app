class UserDataModel {
  final String? sId;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? password;
  final String? role;
  final String? profileImage;
  final String? createdAt;
  final String? updatedAt;
  final String? address;
  final int? phone;
  final String? profession;
  final String? gender;
  final String? website;
  final String? dateOfBirth;
  final String? coverImage;
  final int? iV;

  UserDataModel({
    this.sId,
    this.firstName,
    this.username,
    this.email,
    this.password,
    this.role,
    this.coverImage,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.dateOfBirth,
    this.gender,
    this.lastName,
    this.phone,
    this.profession,
    this.profileImage,
    this.website,
    this.iV,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    String img = json["profileImage"] ?? '';
    if (img.trim().isEmpty) {
      img =
          'https://i.pinimg.com/originals/6e/59/95/6e599501252c23bcf02658617b29c894.jpg';
    }
    return UserDataModel(
      sId: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      coverImage: json["coverImage"],
      profileImage: img,
      profession: json['profession'],
      address: json['address'],
      gender: json['gender'],
      website: json['website'],
      phone: json['phone'],
      dateOfBirth: json['dateOfBirth'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['role'] = this.role;
    data["profileImage"] = this.profileImage;
    data["coverImage"] = this.coverImage;
    data["address"] = this.address;
    data["dateOfBirth"] = this.dateOfBirth;
    data["gender"] = this.gender;
    data["profession"] = this.profession;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
