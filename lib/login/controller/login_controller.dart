import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/login/service/login_service.dart';
import 'package:oldinsa/login/service/shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final loginStateProvider = StateNotifierProvider((ref) {
  final loginHttp = ref.watch(loginProvider);
  final sharedPref = ref.watch(sharedPrefProvider);

  return LoginState(loginHttp, sharedPref);
});

final futureTokenProvider = FutureProvider((ref) async {
  final token = await ref.watch(loginStateProvider.notifier).getToken();
  return token;
});

class LoginModel {
  final AsyncValue<String> token;

  const LoginModel({
    required this.token,
  });

  LoginModel copyWith({
    final AsyncValue<String>? token,
  }) {
    return LoginModel(token: token ?? this.token);
  }
}

class LoginState extends StateNotifier<LoginModel> {
  final LoginHttp _loginHttp;
  final SharedPref _sharedPref;

  LoginState(this._loginHttp, this._sharedPref)
      : super(const LoginModel(token: AsyncValue.loading()));

  Future<String> loginUser(String email, String password) async {
    state = state.copyWith(token: const AsyncValue.loading());

    final token = await _loginHttp.login(email, password);
    _sharedPref.saveToken(token);

    state = state.copyWith(token: AsyncValue.data(token));

    return token;
  }

  Future<String?> getToken() async {
    final result = await _sharedPref.getToken();
    return result;
  }
}
