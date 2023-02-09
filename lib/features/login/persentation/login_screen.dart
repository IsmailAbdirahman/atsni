import 'package:flutter/material.dart';
import 'package:oldinsa/features/login/service/login_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/login_controller.dart';
import '../../../shared_widgets/endpoints.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Column(children: [
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
                      await ref.read(loginStateProvider.notifier).loginUser(
                          _emailController.text, _passwordController.text);
                      ref.refresh(futureTokenProvider);
                    },
                    child: const Text('Login user')),
              ]),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.blue[200]),
                  ))
            ],
          )),
    );
  }
}

class ForgetPasswordEmail extends StatelessWidget {
  final TextEditingController emailController;

  const ForgetPasswordEmail({Key? key, required this.emailController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(hintText: "Email"),
          controller: emailController,
        ),
        ElevatedButton(onPressed: () {}, child: const Text('OK'))
      ],
    );
  }
}
