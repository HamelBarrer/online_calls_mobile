class UserModel {
  final int userId;
  final String username;

  UserModel({
    required this.userId,
    required this.username,
  });

  factory UserModel.fromJsom(Map<String, dynamic> json) {
    return UserModel(userId: json['user_id'], username: json['username']);
  }

  Map<String, dynamic> toJsom() {
    return {
      'user_id': userId,
      'username': username,
    };
  }
}
