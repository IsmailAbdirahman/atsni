import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:oldinsa/login/domain/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:oldinsa/shared_widgets/endpoints.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home/domain/posts.dart';

class LoginHttp {
  Future<String> login(String email, String password) async {
    final data = {'email': email, 'password': password};

    final response = await http.post(Uri.parse('$baseUrl/users/login'),
        headers: headers, body: jsonEncode(data));

    try {
      token = jsonDecode(response.body)['token'];
      return jsonDecode(response.body)['token'];
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<LoginModel> myProfile() async {
    final heade = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response =
        await http.get(Uri.parse('$baseUrl/users/myProfile'), headers: heade);
    debugPrint(response.body.toString());
    try {
      debugPrint(jsonDecode(response.body)['']);
      return LoginModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw (e.toString());
    }
  }



  Future<PostsModel> likePost(String id) async {
    debugPrint(token);

    final heade = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http
          .get(Uri.parse('$baseUrl/userpost/likedPost/$id'), headers: heade);

      debugPrint(response.body.toString());

      return PostsModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw (e.toString());
    }
  }
}
