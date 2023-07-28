import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_calls_mobile/widgets/form/elevated_button_widget.dart';
import 'package:online_calls_mobile/widgets/form/text_field_widget.dart';

class SigninAuthScreen extends HookConsumerWidget {
  const SigninAuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordConfirmController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              controller: usernameController,
              hintText: 'Username',
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              controller: passwordConfirmController,
              hintText: 'Password confirm',
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButtonWidget(
              onPressed: () {},
              nameButton: 'Create account',
            ),
          ],
        ),
      ),
    );
  }
}
