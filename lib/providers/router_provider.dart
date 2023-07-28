import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_calls_mobile/providers/user_provider.dart';
import 'package:online_calls_mobile/screens/app/home_app_screen.dart';
import 'package:online_calls_mobile/screens/auth/login_auth_screen.dart';
import 'package:online_calls_mobile/screens/auth/signin_auth_screen.dart';

final goRouterProvider = StateProvider((ref) {
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) async {
      final user = await ref.watch(currentUserProvider);

      if (user != null) {
        return null;
      }

      if (state.fullPath != '/login' && state.fullPath != '/signin') {
        return '/login';
      }

      return null;
    },
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
      GoRoute(
        path: '/signin',
        name: 'signin',
        builder: (context, state) => const SigninAuthScreen(),
      ),
    ],
  );
});
