import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_calls_mobile/providers/shared_preferences_provider.dart';
import 'package:online_calls_mobile/providers/user_provider.dart';
import 'package:online_calls_mobile/widgets/cards/click_card_widget.dart';

class HomeAppScreen extends HookConsumerWidget {
  const HomeAppScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listUsers = ref.watch(listUsersProvider);
    ref.watch(cleanSharedPreferencesProvider);

    return Scaffold(
      appBar: AppBar(),
      body: listUsers.when(
        data: (users) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) {
                return ClickCardWidget(
                  title: users[i].username,
                  subTitle: 'Activo',
                );
              },
            ),
          );
        },
        error: (err, stack) => Center(
          child: Text('Error: $err'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
