import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_calls_mobile/models/auth_model.dart';
import 'package:online_calls_mobile/providers/shared_preferences_provider.dart';
import 'package:online_calls_mobile/services/auth_service.dart';
import 'package:online_calls_mobile/services/user_service.dart';

final currentUserProvider = StateProvider((ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider);

  final storage = sharedPreferences.getString('user');
  if (storage != null) {
    return UserAuth.fromJsom(jsonDecode(storage));
  }
});

final saveUserProvider =
    StateProvider.family<void, AuthModel>((ref, auth) async {
  final authService = AuthService();
  final sharedPreferences = await ref.watch(sharedPreferencesProvider);

  final response = await authService.login(auth);

  await sharedPreferences.setString('user', jsonEncode(response.toJsom()));
});

final listUsersProvider = FutureProvider((ref) async {
  final userService = UserService();

  final users = await userService.listUsers();

  return users;
});
