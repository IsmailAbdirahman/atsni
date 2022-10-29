import 'package:flutter/material.dart';
import 'package:oldinsa/login/domain/login_model.dart';
import 'package:oldinsa/login/network/login.dart';

import '../../shared_widgets/endpoints.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginHttp _loginHttp = LoginHttp();

  @override
  Widget build(BuildContext context) {
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
                await _loginHttp.login(
                    _emailController.text, _passwordController.text);
              },
              child: const Text('Login')),
          Text(token),
          token == ''
              ? const SizedBox()
              : FutureBuilder<LoginModel>(
                  future: _loginHttp.myProfile(),
                  builder: (BuildContext context, snapshot) {
                    debugPrint(snapshot.data.toString());

                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      final data = snapshot.data;
                      return SizedBox(
                        height: 200,
                        width: 200,
                        child: Card(
                            color: Colors.green[200],
                            child: Column(children: [
                              Text(data!.username),
                              Text('Followers ${data.follower.length}'),
                              Text('Following ${data.following.length}'),
                              Text('Liked Posts ${data.likedPosts.length}'),
                            ])),
                      );
                    }
                  },
                ),
          ElevatedButton(
              onPressed: ()async {
                print("Like Button clicked");
              await _loginHttp.likePost('635b71a950b0e6af3969d390');
              },
              child:const Text('Like Button'))
        ]),
      ),
    );
  }
}
