import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginAuthScreen extends HookConsumerWidget {
  const LoginAuthScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Login'),
      ),
    );
  }
}
