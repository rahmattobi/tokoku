class UserModel {
  int? id;
  String? name;
  String? email;
  // String? profilePhotoUrl;
  // String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    // this.profilePhotoUrl,
    // this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    // profilePhotoUrl = json['profile_photo_url'];
    // token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      // 'profile_photo_url': profilePhotoUrl,
      // 'token': token,
    };
  }
}
