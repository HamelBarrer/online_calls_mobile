import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:online_calls_mobile/constants/api_constant.dart';
import 'package:online_calls_mobile/models/auth_model.dart';
import 'package:online_calls_mobile/models/user_model.dart';

class AuthService {
  final dio = Dio();

  Future<UserAuth> login(AuthModel authModel) async {
    final response = await dio.post(
      ApiConstant.apiAuth,
      data: jsonEncode(
        authModel.toJsom(),
      ),
    );

    if (response.statusCode != 200) {
      return UserAuth(
        userId: 0,
        username: '',
        token: '',
      );
    }

    return UserAuth.fromJsom(jsonDecode(jsonEncode(response.data)));
  }

  Future<UserModel> createUser(UserCreateModel userCreateModel) async {
    try {
      final response = await dio.post(
        ApiConstant.apiUsers,
        data: jsonEncode(userCreateModel.toJsom()),
      );

      return UserModel.fromJsom(jsonDecode(jsonEncode(response.data)));
    } on DioException catch (e) {
      throw e.response!.data;
    }
  }
}
