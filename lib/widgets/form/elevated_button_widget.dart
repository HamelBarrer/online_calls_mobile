import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ElevatedButtonWidget extends HookConsumerWidget {
  final VoidCallback onPressed;
  final String nameButton;
  final Color color;

  const ElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.nameButton,
    this.color = Colors.purple,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          nameButton,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
