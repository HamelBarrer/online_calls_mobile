import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = StateProvider((ref) async {
  return await SharedPreferences.getInstance();
});

final cleanSharedPreferencesProvider = StateProvider((ref) async {
  final shared = await ref.watch(sharedPreferencesProvider);
  await shared.clear();
});
