import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:online_calls_mobile/providers/router_provider.dart';

void main() => runApp(const ProviderScope(child: App()));

class App extends HookConsumerWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerProvider = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      routerConfig: routerProvider,
    );
  }
}
