import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oldinsa/register/data/register.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _userNameController = TextEditingController();

  final Register _register = Register();


   String name ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Username'),
              controller: _userNameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Email'),
              controller: _emailController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Passwrod'),
              controller: _passwordController,
            ),
            ElevatedButton(
                onPressed: ()async {
                  Map<String, dynamic> data = {
                    'username': _userNameController.text,
                    'email': _emailController.text,
                    'password': _passwordController.text
                  };

                 final result = await _register.getUserInfo(data);

                 setState(() {
                   name = result.username;
                 });
                },
                child:  Text('Register $name')),



          ],
        ),
      ),
    );
  }
}
