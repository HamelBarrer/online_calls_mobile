class AuthModel {
  final String username;
  final String password;

  AuthModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJsom() {
    return {
      'username': username,
      'password': password,
    };
  }
}

class UserCreateModel extends AuthModel {
  final String passwordConfirm;

  UserCreateModel({
    required super.username,
    required super.password,
    required this.passwordConfirm,
  });

  @override
  Map<String, dynamic> toJsom() {
    return {
      'username': username,
      'password': password,
      'password_confirm': passwordConfirm,
    };
  }
}

class UserAuth {
  final int userId;
  final String username;
  final String token;

  UserAuth({
    required this.userId,
    required this.username,
    required this.token,
  });

  factory UserAuth.fromJsom(Map<String, dynamic> json) {
    return UserAuth(
      userId: json['user_id'],
      username: json['username'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJsom() {
    return {
      'user_id': userId,
      'username': username,
      'token': token,
    };
  }
}
