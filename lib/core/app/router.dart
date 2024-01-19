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
      final isAuthenticated = auth;
      print('isAuth $isAuthenticated path ${state.fullPath}');

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

  /// Creates a Notifier to be used in GoRouter
  ///
  /// While it is not recommended to use `ChangeNotifier` anywhere else
  /// (reference: https://riverpod.dev/docs/concepts/providers/#different-types-of-providers),
  /// `ChangeNotifier` is a forced choice with go_router.
  ///
  /// GoRouter's refreshListenable only accepts a `Listenable` object as a parameter
  /// and therefore `ChangeNotifier` is used here,
  /// whereas `StateNotifier` is not a `Listenable`, so we can't use it.
  ///
  /// Here we inject a `Ref` so that it's possible to exploit `ref.listen()` to
  /// notify GoRouter that something's changed in our providers.
  ///
  /// Note how we're forced to explicitly call `notifyListeners()`
  /// to make this work.
  RouterNotifier(this._ref) {
    _ref.listen<bool?>(
      authProvider,
      (_, __) => notifyListeners(),
    );
  }
}
