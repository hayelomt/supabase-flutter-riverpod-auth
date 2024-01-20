import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rsupa/features/auth/auth.dart';
import 'package:rsupa/features/home/home.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final auth = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: RouterNotifier(ref),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
    redirect: (context, state) {
      /**
      * Your Redirection Logic Code  Here..........
      */
      final isAuthenticated = !auth.isEmpty;
      debugPrint('isAuth $isAuthenticated path ${state.fullPath}');

      /// [state.fullPath] will give current  route Path

      if (state.fullPath == '/login') {
        return isAuthenticated ? '/' : '/login';
      }

      /// null redirects to Initial Location

      return isAuthenticated ? null : '/login';
    },
  );
}

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AppUser>(
      authProvider,
      (_, __) => notifyListeners(),
    );
  }
}
