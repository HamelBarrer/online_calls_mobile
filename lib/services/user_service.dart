import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:online_calls_mobile/constants/api_constant.dart';
import 'package:online_calls_mobile/models/user_model.dart';

class UserService {
  final dio = Dio();

  Future<List<UserModel>> listUsers() async {
    try {
      List<UserModel> users = [];
      final response = await dio.get(ApiConstant.apiUsers);
      List<dynamic> responseUsers = response.data;

      for (final user in responseUsers) {
        users.add(UserModel.fromJsom(jsonDecode(jsonEncode(user))));
      }

      return users;
    } on DioException catch (e) {
      print(e);
      throw e.response!.data;
    }
  }
}
