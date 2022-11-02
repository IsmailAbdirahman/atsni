import 'package:flutter/material.dart';
import 'package:oldinsa/home/perserntation/home_screen.dart';
import 'package:oldinsa/login/service/login_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/login_controller.dart';
import '../../shared_widgets/endpoints.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Email'),
            controller: _emailController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Password'),
            controller: _passwordController,
          ),
          ElevatedButton(
              onPressed: () async {
                await ref
                    .read(loginStateProvider.notifier)
                    .loginUser(_emailController.text, _passwordController.text);
                ref.refresh(futureTokenProvider);
              },
              child: const Text('Login user')),

        ]),
      ),
    );
  }
}
