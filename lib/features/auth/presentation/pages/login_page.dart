import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rsupa/features/auth/presentation/states/auth.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            ref.watch(authProvider.notifier).login();
          },
          icon: const Icon(Icons.logout),
          label: Text('Login ${auth ? 'true' : 'false'}'),
        ),
      ),
    );
  }
}
