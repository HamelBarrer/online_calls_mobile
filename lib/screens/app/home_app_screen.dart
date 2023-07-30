import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_calls_mobile/screens/app/init_app_screen.dart';
import 'package:online_calls_mobile/screens/app/profile_app_screen.dart';

class HomeAppScreen extends HookConsumerWidget {
  const HomeAppScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const indexScreen = 0;

    List<Widget> widgets = [
      const IniAppScreen(),
      const ProfileAppScreen(),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: IndexedStack(
        index: indexScreen,
        children: widgets,
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
