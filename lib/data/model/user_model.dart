class UserModel {
  String name;
  String email;
  String phone;
  String avatar;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
  });

  static Map<String, dynamic> toJson(UserModel user) {
    return {
      "name": user.name,
      "email": user.email,
      "phone": user.phone,
      "avatar": user.avatar
    };
  }

  static UserModel fromJson(Map<String, dynamic> model) {
    return UserModel(
        name: model["name"],
        email: model["email"],
        phone: model["phone"],
        avatar: model["avatar"]);
  }
}
