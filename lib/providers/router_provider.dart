import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:online_calls_mobile/screens/app/home_app_screen.dart';
import 'package:online_calls_mobile/screens/auth/login_auth_screen.dart';

final goRouterProvider = StateProvider((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeAppScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginAuthScreen(),
      ),
    ],
  );
});
