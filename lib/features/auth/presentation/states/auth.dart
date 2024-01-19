import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  bool build() {
    return false;
  }

  login() async {
    state = true;
  }

  logout() async {
    state = false;
  }
}
